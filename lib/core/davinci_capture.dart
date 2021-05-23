import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'dart:ui' as ui;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class DavinciCapture {
  /// * If the widget is in the widget tree, use this method.
  /// if the fileName is not set, it sets the file name as "davinci".
  /// you can define whether to openFilePreview or returnImageUint8List
  /// openFilePreview is true by default.
  static Future click(GlobalKey key,
      {String fileName = 'davinci',
      bool openFilePreview = true,
      bool saveToDevice = false,
      String? albumName,
      double? pixelRatio,
      bool returnImageUint8List = false}) async {
    try {
      pixelRatio ??= ui.window.devicePixelRatio;

      /// finding the widget in the current context by the key.
      var repaintBoundary =
          key.currentContext!.findRenderObject() as RenderRepaintBoundary;

      /// With the repaintBoundary we got from the context, we start the createImageProcess
      await _createImageProcess(
          albumName: albumName,
          fileName: fileName,
          saveToDevice: saveToDevice,
          returnImageUint8List: returnImageUint8List,
          openFilePreview: openFilePreview,
          repaintBoundary: repaintBoundary,
          pixelRatio: pixelRatio);
    } catch (e) {
      /// if the above process is failed, the error is printed.
      print(e);
    }
  }

  /// * If the widget is not in the widget tree, use this method.
  /// if the fileName is not set, it sets the file name as "davinci".
  /// you can define whether to openFilePreview or returnImageUint8List
  /// If the image is blurry, calculate the pixelratio dynamically. See the readme
  /// for more info on how to do it.
  static Future offStage(Widget widget,
      {Duration? wait,
      bool openFilePreview = true,
      bool saveToDevice = false,
      String fileName = 'davinci',
      String? albumName,
      double? pixelRatio,
      bool returnImageUint8List = false}) async {
    /// finding the widget in the current context by the key.
    final RenderRepaintBoundary repaintBoundary = RenderRepaintBoundary();

    /// create a new pipeline owner
    final PipelineOwner pipelineOwner = PipelineOwner();

    /// create a new build owner
    final BuildOwner buildOwner = BuildOwner(focusManager: FocusManager());

    Size logicalSize = ui.window.physicalSize / ui.window.devicePixelRatio;
    pixelRatio ??= ui.window.devicePixelRatio;
    assert(openFilePreview != returnImageUint8List);

    try {
      final RenderView renderView = RenderView(
        window: ui.window,
        child: RenderPositionedBox(
            alignment: Alignment.center, child: repaintBoundary),
        configuration: ViewConfiguration(
          size: logicalSize,
          devicePixelRatio: 1.0,
        ),
      );

      /// setting the rootNode to the renderview of the widget
      pipelineOwner.rootNode = renderView;

      /// setting the renderView to prepareInitialFrame
      renderView.prepareInitialFrame();

      /// setting the rootElement with the widget that has to be captured
      final RenderObjectToWidgetElement<RenderBox> rootElement =
          RenderObjectToWidgetAdapter<RenderBox>(
        container: repaintBoundary,
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: widget,
        ),
      ).attachToRenderTree(buildOwner);

      ///adding the rootElement to the buildScope
      buildOwner.buildScope(rootElement);

      /// if the wait is null, sometimes
      /// the then waiting for the given [wait] amount of time and
      /// then creating an image via a [RepaintBoundary].

      if (wait != null) {
        await Future.delayed(wait);
      }

      ///adding the rootElement to the buildScope
      buildOwner.buildScope(rootElement);

      /// finialize the buildOwner
      buildOwner.finalizeTree();

      ///Flush Layout
      pipelineOwner.flushLayout();

      /// Flush Compositing Bits
      pipelineOwner.flushCompositingBits();

      /// Flush paint
      pipelineOwner.flushPaint();

      /// we start the createImageProcess once we have the repaintBoundry of
      /// the widget we attached to the widget tree.
      await _createImageProcess(
        saveToDevice: saveToDevice,
        albumName: albumName,
        fileName: fileName,
        returnImageUint8List: returnImageUint8List,
        openFilePreview: openFilePreview,
        repaintBoundary: repaintBoundary,
        pixelRatio: pixelRatio,
      );
    } catch (e) {
      print(e);
    }
  }

  /// create image process
  static Future _createImageProcess(
      {saveToDevice,
      albumName,
      fileName,
      returnImageUint8List,
      openFilePreview,
      repaintBoundary,
      pixelRatio}) async {
    /// the boundary is converted to Image.
    final ui.Image image =
        await repaintBoundary.toImage(pixelRatio: pixelRatio);

    /// The raw image is converted to byte data.
    final ByteData? byteData =
        await image.toByteData(format: ui.ImageByteFormat.png);

    /// The byteData is converted to uInt8List image aka memory Image.
    final u8Image = byteData!.buffer.asUint8List();

    if (saveToDevice) {
      _saveImageToDevice(albumName, fileName);
    }

    /// If the returnImageUint8List is true, return the image as uInt8List
    if (returnImageUint8List) {
      return u8Image;
    }

    /// if the openFilePreview is true, open the image in openFile
    if (openFilePreview) {
      await _openImagePreview(u8Image, fileName);
    }
  }

  static Future _openImagePreview(Uint8List u8Image, String imageName) async {
    /// getting the temp directory of the app.
    String dir = (await getApplicationDocumentsDirectory()).path;

    /// Saving the file with the file name in temp directory.
    File file = File('$dir/$imageName.png');

    /// the image file is created
    await file.writeAsBytes(u8Image);

    /// The image file is opened.
    await OpenFile.open(
      '$dir/$imageName.png',
    );

    return file;
  }

  /// To save the images locally
  static void _saveImageToDevice(String? album, String imageName) async {
    /// getting the temp directory of the app.
    String dir = (await getApplicationDocumentsDirectory()).path;

    /// Saving the file with the file name in temp directory.
    File file = File('$dir/$imageName.png');

    /// The image is saved with the file path and to the album if defined,
    /// if the album is null, it saves to the all pictures.
    await GallerySaver.saveImage(file.path, albumName: album);
  }
}
