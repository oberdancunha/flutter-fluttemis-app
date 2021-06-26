import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../infrastructure/locus_data_source_genbank_file.dart';
import '../templates/container_box_template.dart';

class MenuWidget extends StatefulWidget {
  final double width;
  final double height;
  final double itemWidth;
  final double itemHeight;
  final double iconWidth;
  final double? fontSize;
  final bool showLabel;
  final bool showTooltip;
  final double? borderRadius;

  const MenuWidget({
    required this.width,
    required this.height,
    required this.itemWidth,
    required this.itemHeight,
    required this.iconWidth,
    this.fontSize,
    this.showLabel = false,
    this.showTooltip = false,
    this.borderRadius = 30,
    Key? key,
  }) : super(key: key);

  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  double rotateAngle = 0;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: widget.width,
        height: widget.height,
        child: Center(
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            runSpacing: 10,
            spacing: 30,
            children: [
              GestureDetector(
                onTap: () async {
                  final result = await _openFile();
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
                  label: 'Open genbank file (.genbank, .gb or .gbk)',
                  color: const Color(0xFF003333),
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
    required Color color,
  }) =>
      _showTooltip(
        message: label,
        child: SingleChildScrollView(
          child: Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(rotateAngle),
            child: Column(
              children: [
                ContainerBoxTemplate(
                  width: widget.itemWidth,
                  height: widget.itemHeight,
                  color: color,
                  borderRadius: widget.borderRadius,
                  child: Center(
                    child: Image.asset(
                      icon,
                      width: widget.iconWidth,
                    ),
                  ),
                ),
                if (widget.showLabel)
                  Column(
                    children: [
                      const SizedBox(height: 10),
                      SizedBox(
                        child: Text(
                          label,
                          style: TextStyle(
                            fontSize: widget.fontSize,
                            fontWeight: FontWeight.bold,
                          ),
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

  Future<FilePickerResult?> _openFile() async {
    setState(() {
      rotateAngle = 50.0;
    });

    return FilePicker.platform.pickFiles().catchError(
      (_) {
        setState(() {
          rotateAngle = 0;
        });
      },
    );
  }

  Widget _showTooltip({
    required String message,
    required Widget child,
  }) =>
      widget.showTooltip
          ? Tooltip(
              message: message,
              preferBelow: true,
              verticalOffset: 30,
              child: child,
            )
          : Container(
              child: child,
            );
}
