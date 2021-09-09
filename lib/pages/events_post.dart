import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hagerawi_app/components/sidebar.dart';
import 'package:hagerawi_app/components/cards.dart';

class AdminEvents extends StatefulWidget {
  const AdminEvents({Key? key}) : super(key: key);
  static const String routeName = '/admin_feeds';

  @override
  _AdminEventsState createState() => _AdminEventsState();
}

class _AdminEventsState extends State<AdminEvents> {
  final _myKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        primary: Colors.grey.shade200.withAlpha(120), // background
        onPrimary: Colors.white,
        alignment: Alignment.centerRight // foreground
        );

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.blueGrey.shade900,
      statusBarIconBrightness: Brightness.light,
    ));
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Events post',
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey.shade900,
            title: const Text('Post Events'),
          ),
          body: Center(
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade500,
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.grey.shade600,
                      Colors.blueGrey.shade800,
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                child: ListView(
                  padding: const EdgeInsets.all(40),
                  children: <Widget>[
                    Container(
                        height: 100,
                        child: Center(
                          child: Row(
                            children: const <Widget>[
                              Expanded(
                                child: Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                                    child: const Align(
                                        alignment: Alignment.centerRight,
                                        child: Text('Event Name',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 25)))),
                              ),
                              Expanded(
                                  child: TextField(
                                cursorHeight: 15,
                                style: TextStyle(
                                  fontSize: 15,
                                  height: 2,
                                ),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Event Name',
                                ),
                              ))
                            ],
                          ),
                        )),
                    Container(
                        height: 100,
                        child: Center(
                          child: Row(
                            children: const <Widget>[
                              Expanded(
                                child: Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                                    child: const Align(
                                        alignment: Alignment.centerRight,
                                        child: Text('Place',
                                            style: TextStyle(fontSize: 25)))),
                              ),
                              Expanded(
                                  child: TextField(
                                cursorHeight: 15,
                                style: TextStyle(
                                  fontSize: 15,
                                  height: 2,
                                ),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Place',
                                ),
                              ))
                            ],
                          ),
                        )),
                    Container(
                        height: 100,
                        child: Center(
                          child: Row(
                            children: const <Widget>[
                              Expanded(
                                child: Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                                    child: const Align(
                                        alignment: Alignment.centerRight,
                                        child: Text('Description',
                                            style: TextStyle(fontSize: 25)))),
                              ),
                              Expanded(
                                  child: TextField(
                                cursorHeight: 15,
                                style: TextStyle(
                                  fontSize: 15,
                                  height: 2,
                                ),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Description',
                                ),
                              ))
                            ],
                          ),
                        )),
                    Container(
                        height: 100,
                        child: Center(
                          child: Row(
                            children: const <Widget>[
                              Expanded(
                                child: Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                                    child: const Align(
                                        alignment: Alignment.centerRight,
                                        child: Text('Date',
                                            style: TextStyle(fontSize: 25)))),
                              ),
                              Expanded(
                                  child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Date',
                                ),
                              ))
                            ],
                          ),
                        )),
                    Container(
                        height: 500,
                        alignment: Alignment.topCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            ElevatedButton(
                              style: style,
                              onPressed: haya,
                              child: const Text('Submit'),
                            ),
                          ],
                        )),
                  ],
                )),
          ),
        ));
  }
}

void haya() {
  print("text");
}

  /// Creates a [Category].
  ///
  /// A [Category] saves the name of the Category (e.g. 'Length'), its color for
  /// the UI, and the icon that represents it (e.g. a ruler).
  // While the @required checks for whether a named parameter is passed in,
  // it doesn't check whether the object passed in is null. We check that
  // in the assert statement.
