// Copyright 2018 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart';

import 'package:oktoast/oktoast.dart';

import 'index.dart';

void main() {
  // See https://github.com/flutter/flutter/wiki/Desktop-shells#target-platform-override
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;

  runApp(
    OKToast(
      position: ToastPosition(align: Alignment.topCenter, offset: -50),
      child: new MyApp(),
    ),
  );
}

///
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // See https://github.com/flutter/flutter/wiki/Desktop-shells#fonts
        fontFamily: 'Roboto',
        platform: TargetPlatform.iOS,
      ),
      home: IndexPage(),
    );
  }
}

///
class MyHomePage extends StatefulWidget {
  ///
  const MyHomePage({Key key, this.title}) : super(key: key);

  ///
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  TextEditingController ctl = TextEditingController();
  ToastFuture future;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    ctl.text = _counter.toString();
    final offset = _counter.toString().length;
    final textSelection =
        TextSelection(baseOffset: offset, extentOffset: offset);
    ctl.selection = textSelection;
    future = showToast('当前数字: $_counter', duration: Duration(seconds: 5));
  }

  @override
  void initState() {
    super.initState();
    ctl.addListener(() {
      final i = int.tryParse(ctl.text);
      if (i != null) {
        setState(() {
          _counter = i;
        });
      }
    });
  }

  @override
  void dispose() {
    ctl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          FlatButton(
            child: Text('关闭'),
            onPressed: () {
              future?.dismiss(showAnim: true);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            Container(
              child: Text('我是一个文本'),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
            ),
            TextField(
              controller: ctl,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
