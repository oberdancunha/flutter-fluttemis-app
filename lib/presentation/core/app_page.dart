import 'package:flutter/material.dart';

import 'widgets/upload_file.dart';

class AppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.orange.shade100,
                Colors.blue.shade100,
              ],
            ),
          ),
          child: UploadFile(),
        ),
      );
}
