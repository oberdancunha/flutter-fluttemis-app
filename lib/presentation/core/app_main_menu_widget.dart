import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../external/locus/locus_data_source_genbank_file.dart';

class AppMainMenuWidget extends StatefulWidget {
  final double width;
  final double height;
  final double iconWidth;
  final double? fontSize;
  final bool showLabel;
  final bool showTooltip;
  final double? borderRadius;

  const AppMainMenuWidget({
    required this.width,
    required this.height,
    required this.iconWidth,
    this.fontSize,
    this.showLabel = false,
    this.showTooltip = false,
    this.borderRadius = 30,
    Key? key,
  }) : super(key: key);

  @override
  _AppMainMenuWidgetState createState() => _AppMainMenuWidgetState();
}

class _AppMainMenuWidgetState extends State<AppMainMenuWidget> {
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
                  icon: 'assets/icons/genbank_app',
                  label: 'Open genbank file',
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
      _showTooltip(
        message: label,
        child: SingleChildScrollView(
          child: Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(rotateAngle),
            child: Column(
              children: [
                Image.asset(
                  '$icon/${widget.iconWidth >= 64 ? 'icon_256.png' : 'icon_64.png'}',
                  width: widget.iconWidth,
                ),
                if (widget.showLabel)
                  Column(
                    children: [
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
