import 'package:flutter/material.dart';

class ContainerBoxTemplate extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final BoxBorder? border;
  final Color? boxShadowColor;

  const ContainerBoxTemplate({
    required this.child,
    this.height,
    this.width,
    this.border,
    this.boxShadowColor = Colors.grey,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: border,
          boxShadow: [
            BoxShadow(
              color: boxShadowColor!.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: child,
      );
}
