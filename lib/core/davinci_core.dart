import 'package:flutter/material.dart';

class Davinci extends StatefulWidget {
  /// builder is passed along with the key.
  final Function(GlobalKey key)? builder;

  const Davinci({this.builder});
  @override
  _DavinciState createState() => _DavinciState();
}

class _DavinciState extends State<Davinci> {
  /// global key is defined which is set the the RepaintBoundary.
  final GlobalKey globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    /// this is the widget which will help the plugin to understand and
    /// identify which widget has to be selected and turned into image.
    return RepaintBoundary(
      /// the global key is key which is set in State variable
      key: globalKey,

      /// the children is what passed in, along with the key.
      child: widget.builder!(globalKey),
    );
  }
}
