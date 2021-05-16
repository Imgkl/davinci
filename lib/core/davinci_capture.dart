import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class DavinciCapture {
  /// * If the widget is in the widget tree, use this method.
  /// if the fileName is not set, it sets the file name as "davinci".
  /// you can define whether to openFilePreview or returnImageUint8List
  /// openFilePreview is true by default.
  static Future click(GlobalKey key,
      {String fileName = "davinci",
      bool openFilePreview = true,
      double pixelRatio = 3.0,
      bool returnImageUint8List = false}) async {
    assert(openFilePreview != returnImageUint8List);
    try {
      /// finding the widget in the current context by the key.
      RenderRepaintBoundary boundary =
          key.currentContext!.findRenderObject() as RenderRepaintBoundary;

      /// the boundary is converted to Image.
      final image = await boundary.toImage(pixelRatio: pixelRatio);

      /// The raw image is converted to byte data.
      final byteData = await (image.toByteData(format: ui.ImageByteFormat.png));

      /// The byteData is converted to uInt8List image aka memory Image.
      final u8Image = byteData!.buffer.asUint8List();

      if (returnImageUint8List) {
        return u8Image;
      }

      if (openFilePreview) {
        _openImagePreview(u8Image, fileName);
      }
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
      Size? logicalSize,
      Size? imageSize,
      bool openFilePreview = true,
      double pixelRatio = 3.0,
      String fileName = "davinci",
      bool returnImageUint8List = false}) async {
    /// finding the widget in the current context by the key.
    final RenderRepaintBoundary repaintBoundary = RenderRepaintBoundary();

    /// create a new pipeline owner
    final PipelineOwner pipelineOwner = PipelineOwner();

    /// create a new build owner
    final BuildOwner buildOwner = BuildOwner();

    logicalSize ??= ui.window.physicalSize / ui.window.devicePixelRatio;
    imageSize ??= ui.window.physicalSize;
    assert(openFilePreview != returnImageUint8List);
    assert(logicalSize.aspectRatio == imageSize.aspectRatio);

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
              )).attachToRenderTree(buildOwner);

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

      /// the boundary is converted to Image.
      final ui.Image image = await repaintBoundary.toImage(
          pixelRatio: imageSize.width / logicalSize.width);

      /// The raw image is converted to byte data.
      final ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);

      /// The byteData is converted to uInt8List image aka memory Image.
      final u8Image = byteData!.buffer.asUint8List();

      /// If the returnImageUint8List is true, return the image as uInt8List
      if (returnImageUint8List) {
        return u8Image;
      }

      /// if the openFilePreview is true, open the image in openFile
      if (openFilePreview) {
        _openImagePreview(u8Image, fileName);
      }
    } catch (e) {
      print(e);
    }
  }

  static _openImagePreview(Uint8List u8Image, String imageName) async {
    /// getting the temp directory of the app.
    String dir = (await getApplicationDocumentsDirectory()).path;

    /// Saving the file with the file name in temp directory.
    File file = new File('$dir/$imageName.png');

    /// the image file is created
    await file.writeAsBytes(u8Image);

    /// The image file is opened.
    OpenFile.open(
      '$dir/$imageName.png',
    );

    /// The file is returned.
    return file;
  }
}
