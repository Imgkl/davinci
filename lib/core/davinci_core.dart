import 'package:flutter/material.dart';

class Davinci extends StatefulWidget {
  final Function(GlobalKey key) builder;

  const Davinci({Key key, this.builder}) : super(key: key);
  @override
  _DavinciState createState() => _DavinciState();
}

class _DavinciState extends State<Davinci> {
  final globalkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: globalkey,
      child: widget.builder(globalkey),
    );
  }
}
