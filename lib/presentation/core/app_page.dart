import 'package:flutter/material.dart';

import '../core/templates/background_template.dart';
import 'widgets/menu_widget.dart';

class AppPage extends StatelessWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    const minWidth = 1200.0;
    const minHeight = 600.0;
    final width = screenWidth > minWidth ? screenWidth : minWidth;
    final height = screenHeight > minHeight ? screenHeight : minHeight;

    return Scaffold(
      body: BackgroundTemplate(
        child: SizedBox(
          width: screenWidth,
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: MenuWidget(
                width: width / 5,
                height: height,
                fontSize: width / 80,
                iconWidth: width / 12,
                gridAxisCount: 1,
                showLabel: true,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
