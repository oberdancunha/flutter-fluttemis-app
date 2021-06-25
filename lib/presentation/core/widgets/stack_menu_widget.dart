import 'package:animated_stack/animated_stack.dart';
import 'package:flutter/material.dart';

import '../templates/background_template.dart';
import 'menu_widget.dart';

class StackMenuWidget extends StatelessWidget {
  final Widget child;

  const StackMenuWidget({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => AnimatedStack(
        fabBackgroundColor: Colors.redAccent.shade700,
        backgroundColor: Colors.red.shade50,
        columnWidget: SizedBox(
          child: MenuWidget(
            width: MediaQuery.of(context).size.width,
            height: 60,
            itemWidth: 60,
            itemHeight: 60,
            iconWidth: 50,
            showTooltip: true,
            borderRadius: 15,
          ),
        ),
        bottomWidget: Container(),
        foregroundWidget: BackgroundTemplate(child: child),
        buttonIcon: Icons.menu,
      );
}
