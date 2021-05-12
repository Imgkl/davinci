import 'package:flutter/material.dart';

class Davinci extends StatelessWidget {
  /// builder is passed along with the key.
  final Function(GlobalKey key)? builder;

  const Davinci({this.builder});

  @override
  Widget build(BuildContext context) {
    /// Getting the global key which will be used to passed to RepaintBoundary
    final GlobalKey globalKey = GlobalKey();

    /// global key is defined which is set the the RepaintBoundary.
    /// this is the widget which will help the plugin to understand and
    /// identify which widget has to be selected and turned into image.

    return RepaintBoundary(
      /// the global key is key which is set in State variable
      key: globalKey,

      /// the children is what passed in, along with the key.
      child: builder!(globalKey),
    );
  }
}
