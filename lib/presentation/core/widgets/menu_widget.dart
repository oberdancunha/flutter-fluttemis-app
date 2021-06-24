import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../infrastructure/locus_data_source_genbank_file.dart';
import '../templates/container_box_template.dart';

class MenuWidget extends StatelessWidget {
  final double width;
  final double height;
  final double? fontSize;
  final double iconWidth;
  final int gridAxisCount;
  final bool showLabel;

  const MenuWidget({
    required this.width,
    required this.height,
    required this.iconWidth,
    required this.gridAxisCount,
    required this.showLabel,
    this.fontSize,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        width: width,
        height: height,
        child: Center(
          child: GridView.count(
            crossAxisCount: gridAxisCount,
            padding: const EdgeInsets.all(20),
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            shrinkWrap: true,
            children: [
              GestureDetector(
                onTap: () async {
                  final result = await FilePicker.platform.pickFiles().catchError((_) => null);
                  if (result != null) {
                    final file = result.files.single.path!;
                    final dataSourceInstance = LocusDataSourceGenbankFile(genbankFile: file);
                    Modular.to.popAndPushNamed(
                      '/locus',
                      arguments: dataSourceInstance,
                      forRoot: true,
                    );
                  }
                },
                child: _buildMenuOptions(
                  context: context,
                  icon: 'assets/images/genbank_logo.png',
                  label: 'Genbank file (.genbank, .gb or .gbk)',
                ),
              ),
            ],
          ),
        ),
      );

  Widget _buildMenuOptions({
    required BuildContext context,
    required String icon,
    required String label,
  }) =>
      ContainerBoxTemplate(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  icon,
                  width: iconWidth,
                ),
                if (showLabel)
                  Column(
                    children: [
                      const SizedBox(height: 15),
                      SizedBox(
                        child: Text(
                          label,
                          style: TextStyle(fontSize: fontSize),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      );
}
