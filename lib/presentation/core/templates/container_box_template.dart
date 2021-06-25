import 'package:flutter/material.dart';

class ContainerBoxTemplate extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final Color? color;
  final BoxBorder? border;
  final Color? boxShadowColor;
  final BoxConstraints? constraints;
  final double? borderRadius;

  const ContainerBoxTemplate({
    required this.child,
    this.height,
    this.width,
    this.color = Colors.white,
    this.border,
    this.boxShadowColor,
    this.constraints,
    this.borderRadius = 10,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        constraints: constraints,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius!),
          border: border,
          boxShadow: [
            BoxShadow(
              color: (boxShadowColor ?? Colors.grey).withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: child,
      );
}
