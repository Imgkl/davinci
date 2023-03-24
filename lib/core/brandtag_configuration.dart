import 'package:flutter/material.dart';

class BrandTagConfiguration {
  final Widget leading;
  final Widget trailing;
  final EdgeInsetsGeometry padding;
  final double height;
  final BoxDecoration decoration;

  BrandTagConfiguration({
    required this.leading,
    required this.trailing,
    this.padding = EdgeInsets.zero,
    this.decoration = const BoxDecoration(color: Colors.grey),
    this.height = 50,
  });
}
