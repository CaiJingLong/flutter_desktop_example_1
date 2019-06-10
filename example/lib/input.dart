import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('输入测试'),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            TextField(),
          ],
        ),
      ),
    );
  }
}
