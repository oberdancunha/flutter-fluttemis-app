import 'package:flutter/material.dart';

import '../core/templates/background_template.dart';
import 'widgets/upload_file.dart';

class AppPage extends StatelessWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: BackgroundTemplate(
          child: UploadFile(),
        ),
      );
}
