import 'package:flutter/material.dart';

import 'container_box_template.dart';

class ContainerBoxDetailsTemplate extends StatelessWidget {
  final double width;
  final double internalBoxWidth;
  final double? internalBoxHeight;
  final double minimalInternalBoxWidth;
  final Color? boxShadowColor;
  final BoxBorder? border;
  final Widget child;

  const ContainerBoxDetailsTemplate({
    required this.width,
    required this.internalBoxWidth,
    required this.minimalInternalBoxWidth,
    required this.child,
    this.boxShadowColor,
    this.border,
    this.internalBoxHeight,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = ScrollController();

    return ContainerBoxTemplate(
      width: width,
      boxShadowColor: boxShadowColor,
      border: border,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Scrollbar(
            key: key,
            isAlwaysShown: width < minimalInternalBoxWidth,
            controller: _controller,
            child: SingleChildScrollView(
              key: key,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(bottom: 25),
              controller: _controller,
              child: Container(
                constraints: BoxConstraints(minWidth: minimalInternalBoxWidth),
                width: internalBoxWidth,
                height: internalBoxHeight,
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
