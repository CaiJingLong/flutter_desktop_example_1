import 'dart:io';

import 'package:flutter/material.dart';

import 'const/resource.dart';

class ImagePage extends StatefulWidget {
  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          Container(
            color: Colors.red,
            child: Image.network(
                'https://raw.githubusercontent.com/kikt-blog/image/master/img/20190610151657.png'),
          ),
          Container(
            color: Colors.blue,
            child: Image.file(File('/Users/cai/Desktop/apng_spinfox.png')),
          ),
          Container(
            color: Colors.red,
            child: Image.asset(R.ASSETS_1_PNG),
          ),
        ],
      ),
    );
  }
}
