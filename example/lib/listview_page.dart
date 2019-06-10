import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('无限滚动'),
      ),
      body: ListView.builder(
        itemCount: 3939,
        itemBuilder: _buildItem,
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return ListTile(
      title: Text('我是第$index 个item'),
      // subtitle: index % 2 == 0 ? Text('') : Container(),
    );
  }
}
