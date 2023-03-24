import 'package:davinci/core/brandtag_configuration.dart';
import 'package:flutter/material.dart';

class Davinci extends StatelessWidget {
  /// builder is passed along with the key.
  final Function(GlobalKey key)? builder;

  /// Added brand configuration to the davinci

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

class BrandTagBuilder extends StatelessWidget {
  /// Pass the BrandTagConfiguration to build the brand footer
  final BrandTagConfiguration tagConfiguration;

  BrandTagBuilder({key, required this.tagConfiguration});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // From the tagConfiguration we take padding
          padding: tagConfiguration.padding,
          // From the tagConfiguration we take decoration
          decoration: tagConfiguration.decoration,
          // From the tagConfiguration we take height
          height: tagConfiguration.height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // From the tagConfiguration we take leading
              tagConfiguration.leading,
              // From the tagConfiguration we take trailing
              tagConfiguration.trailing,
            ],
          ),
        ),
      ],
    );
  }
}
