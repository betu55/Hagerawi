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
              'Post Events',
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
                      DataCell(Text('Event name')),
                      DataCell(Padding(
                          padding: EdgeInsets.all(2.0),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Event name',
                            ),
                          )))
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Place')),
                      DataCell(Padding(
                          padding: EdgeInsets.all(2.0),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Place',
                            ),
                          ))),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Description')),
                      DataCell(Padding(
                          padding: EdgeInsets.all(2.0),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Desc',
                            ),
                          ))),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Date')),
                      DataCell(Padding(
                          padding: EdgeInsets.all(2.0),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Date',
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
                            print('Pressed');
                          },
                        )))
              ]),
            ),
          )),
    );
  }
}
