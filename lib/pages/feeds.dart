import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hagerawi_app/components/fields.dart';
import 'package:hagerawi_app/components/sidebar.dart';
import 'package:hagerawi_app/components/cards.dart';

// ignore: camel_case_types
class Feeds extends StatefulWidget {
  const Feeds({Key? key}) : super(key: key);
  static const String routeName = '/feeds';

  @override
  _FeedsState createState() => _FeedsState();
}

class _FeedsState extends State<Feeds> {
  final _myKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.blueGrey.shade900,
      statusBarIconBrightness: Brightness.light,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   appBarTheme: AppBarTheme(
      //     backwardsCompatibility: false, // 1
      //     systemOverlayStyle: SystemUiOverlayStyle.dark, // 2
      //   ),
      // ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        key: _myKey,
        drawer: Navbar(),
        body: SafeArea(
          child: Stack(
            children: [
              //main background
              Container(
                color: Colors.grey.shade800,
              ),
              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: (MediaQuery.of(context).size.height) / 4,
                    width: double.infinity,
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
                    //this is the top part where your username and the search bar are
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Expanded(
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                        borderRadius: BorderRadius.circular(20),
                                        onTap: () {
                                          _myKey.currentState!.openDrawer();
                                        },
                                        splashColor:
                                            Colors.blueGrey.withAlpha(100),
                                        child: Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          child: Icon(
                                            Icons.menu,
                                            color: Colors.grey.shade200
                                                .withAlpha(120),
                                            size: 26,
                                          ),
                                        )),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      "Welcome Betu",
                                      style: TextStyle(
                                        color:
                                            Colors.grey.shade200.withAlpha(120),
                                        fontSize: 24,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text(
                          "Why dont you try searching for a feed?",
                          style: TextStyle(
                            color: Colors.grey.shade200.withAlpha(120),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 10),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    width: 280,
                                    child: InputField("Enter a search key")),
                                SizedBox(width: 5),
                                Material(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.shade200.withAlpha(120),
                                  child: InkWell(
                                      borderRadius: BorderRadius.circular(10),
                                      onTap: () {
                                        print("searching...");
                                      },
                                      splashColor:
                                          Colors.blueGrey.withAlpha(100),
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Icon(
                                          Icons.search,
                                          color: Colors.blueGrey,
                                          size: 26,
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20)
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 50,
                      itemBuilder: (BuildContext context, i) {
                        return TheCard();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
