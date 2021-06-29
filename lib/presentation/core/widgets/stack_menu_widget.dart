import 'package:animated_stack/animated_stack.dart';
import 'package:flutter/material.dart';

import '../templates/background_template.dart';
import '../app_main_menu_widget.dart';

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
          child: AppMainMenuWidget(
            width: MediaQuery.of(context).size.width,
            height: 60,
            iconWidth: 60,
            showTooltip: true,
            borderRadius: 15,
          ),
        ),
        bottomWidget: Container(),
        foregroundWidget: BackgroundTemplate(child: child),
        buttonIcon: Icons.menu,
      );
}
