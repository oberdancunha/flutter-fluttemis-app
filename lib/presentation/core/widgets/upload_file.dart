import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../infrastructure/locus_data_source_genbank_file.dart';

class UploadFile extends StatelessWidget {
  const UploadFile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: GestureDetector(
          onTap: () async {
            final result = await FilePicker.platform.pickFiles().catchError(
                  (_) => null,
                );
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
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.blue.shade900,
                width: 5,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.file_upload_rounded,
                  size: 150,
                  color: Colors.blue.shade900,
                ),
                Text(
                  'Open a file (gb or gbk file)',
                  style: TextStyle(
                    color: Colors.blue.shade900,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
