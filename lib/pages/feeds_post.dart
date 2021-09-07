import 'package:flutter/material.dart';
import 'package:hagerawi_app/components/sidebar.dart';
import 'package:hagerawi_app/components/cards.dart';
import 'package:hagerawi_app/feed/feed_model.dart';

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
                DataTable(
                  columns: [
                    DataColumn(
                        label: Text('Post Content',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Text('Title')),
                      DataCell(Padding(
                          padding: EdgeInsets.all(2.0),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Title',
                            ),
                          )))
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Content')),
                      DataCell(Padding(
                          padding: EdgeInsets.all(2.0),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Content',
                            ),
                          ))),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Author')),
                      DataCell(Padding(
                          padding: EdgeInsets.all(2.0),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Author',
                            ),
                          ))),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('15')),
                      DataCell(Padding(
                          padding: EdgeInsets.all(2.0),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Title',
                            ),
                          ))),
                    ]),
                  ],
                ),
                Container(
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(400, 50, 400, 0),
                        child: ElevatedButton(
                          child: Text('Submit'),
                          style: TextButton.styleFrom(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 40,
                                fontStyle: FontStyle.italic),
                            primary: Colors.white,
                            backgroundColor: Colors.grey.shade700,
                            onSurface: Colors.grey,
                          ),
                          onPressed: () {
                            print("pressed");
                          },
                        )))
              ]),
            ),
          )),
    );
  }
}
