import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _DataTableExample createState() => _DataTableExample();
}

class _DataTableExample extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey.shade700,
            title: Center(
                child: Text(
              'New Feeds ',
              style: TextStyle(fontSize: 30),
            )),
          ),
          body: Container(
            child: Center(
              child: ListView(children: <Widget>[
                ),
            ),
          )),
    );
  }
}
