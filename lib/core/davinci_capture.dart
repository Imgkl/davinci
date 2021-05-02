import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class DavinciCapture {
  /// click method is defined.
  /// if the fileName is not set, it sets the file name as "davinci".
  static Future click(GlobalKey key, {String fileName = "davinci"}) async {
    /// if the key is null, it returns null
    if (key == null) return;
    try {
      /// finding the widget in the current context by the key.
      RenderRepaintBoundary boundary = key.currentContext.findRenderObject();

      /// the boundary is converted to Image.
      final image = await boundary.toImage(pixelRatio: 3);

      /// The raw image is converted to byte data.
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

      /// The byteData is converted to uInt8List image aka memory Image.
      final u8Image = byteData.buffer.asUint8List();

      /// getting the temp directory of the app.
      String dir = (await getApplicationDocumentsDirectory()).path;

      /// Saving the file with the file name in temp directory.
      File file = new File('$dir/$fileName.png');

      /// the image file is created
      await file.writeAsBytes(u8Image);

      /// The image file is opened.
      OpenFile.open(
        '$dir/$fileName.png',
      );

      /// The file is returned.
      return file;
    } catch (e) {
      /// if the above process is failed, the error is printed.
      print(e);
    }
  }
}
