import 'package:flutter/material.dart';

import 'image.dart';
import 'input.dart';
import 'listview_page.dart';
import 'local_file_picker.dart';

///
class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    final items = <_Item>[
      _Item('输入测试', InputPage()),
      _Item('图片测试', ImagePage()),
      _Item('ListView测试', ListViewPage()),
      _Item('本地插件试用', LocalFilePickerPage()),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('我是标题'),
      ),
      body: ListView(
          children: items.map((item) {
        return item.buildItem(context);
      }).toList()),
    );
  }
}

class _Item {
  _Item(this.title, this.page);

  final String title;
  final Widget page;

  Widget buildItem(BuildContext context) {
    return FlatButton(
      child: Text(title),
      onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => page)),
    );
  }
}
