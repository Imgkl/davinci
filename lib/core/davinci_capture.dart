import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class DavinciCapture {
  static Future click(GlobalKey key, {String fileName = "davinci"}) async {
    if (key == null) return;
    try {
      RenderRepaintBoundary boundary = key.currentContext.findRenderObject();
      final image = await boundary.toImage(pixelRatio: 3);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      final u8Image = byteData.buffer.asUint8List();
      String dir = (await getApplicationDocumentsDirectory()).path;
      File file = new File('$dir/$fileName.png');
      await file.writeAsBytes(u8Image);
      OpenFile.open(
        '$dir/$fileName.png',
      );
      return file;
    } catch (e) {
      print(e);
    }
  }
}
