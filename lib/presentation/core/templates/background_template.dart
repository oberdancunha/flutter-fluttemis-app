import 'package:flutter/material.dart';

class BackgroundTemplate extends StatelessWidget {
  final Widget child;

  const BackgroundTemplate({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.orange.shade50,
              Colors.deepPurple.shade50,
              Colors.red.shade50,
              Colors.pink.shade50,
              Colors.brown.shade50,
            ],
          ),
        ),
        child: child,
      );
}
