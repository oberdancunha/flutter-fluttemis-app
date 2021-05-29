import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class UploadFile extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(
        child: GestureDetector(
          onTap: () async {
            final result = await FilePicker.platform.pickFiles(
              type: FileType.custom,
              allowedExtensions: ['gb'],
            );
            if (result != null) {
              final file = File(result.files.single.path!);
            }
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey.shade300,
                width: 5,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.file_upload_rounded,
                  size: 150,
                  color: Colors.grey.shade300,
                ),
                const Text(
                  'Open a file',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
