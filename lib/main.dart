import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'files/sidebar.dart';
import 'files/cards.dart';

void doSth() {
  print("working progress real <.>");
}

void main() {
  GestureBinding.instance?.resamplingEnabled = true;
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(EventsPage());
}

class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  Color darkBlueHex = Color(0xff023047);
  Color darkgreyHex = Color(0xff777777);
  Color warmOrangeHex = Color(0xffccc5b9);
  Color warmOrangeHexBtn = Color(0xffccc5b9);
  Color ligthOrangeHex = Color(0xffF4A261);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: darkgreyHex,
          drawer: Navbar(),
          appBar: AppBar(
            title: Text(
              "Events",
              style: TextStyle(color: warmOrangeHex),
            ),
            centerTitle: true,
            backgroundColor: darkBlueHex,
            backwardsCompatibility: true,
            iconTheme: IconThemeData(color: warmOrangeHex),
          ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     setState(() {
          //       num += 1;
          //     });
          //   },
          //   focusElevation: 5,
          //   backgroundColor: darkBlueHex,
          //   child: Icon(Icons.add),
          // ),
          body: ListView.builder(
            itemCount: cards.length,
            itemBuilder: (context, i) {
              return cards[i];
            },
          ),
        ));
  }
}
