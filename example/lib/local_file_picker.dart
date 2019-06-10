import 'dart:io';

import 'package:file_chooser/file_chooser.dart';

import 'package:flutter/material.dart';

class LocalFilePickerPage extends StatefulWidget {
  @override
  _LocalFilePickerPageState createState() => _LocalFilePickerPageState();
}

class _LocalFilePickerPageState extends State<LocalFilePickerPage> {
  File file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('测试使用文件选择器'),
      ),
      body: Container(
        child: Text('我选择的文件 : ${file?.path}'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.attach_file),
        onPressed: () async {
          showOpenPanel(
            (results, path) {
              print('results: $results, path = $path');
            },
            allowsMultipleSelection: true,
          );
        },
      ),
    );
  }
}
