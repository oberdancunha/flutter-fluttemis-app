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
              Colors.grey.shade50,
              Colors.blueGrey.shade50,
              Colors.lightBlue.shade50,
            ],
          ),
        ),
        child: child,
      );
}
