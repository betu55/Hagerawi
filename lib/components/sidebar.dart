import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hagerawi_app/auth/screens/login.dart';
import 'package:hagerawi_app/event/screens/program.dart';
import 'package:hagerawi_app/feed/screens/feeds.dart';
import 'package:hagerawi_app/pages/events.dart';
import 'package:hagerawi_app/quiz/screens/quiz.dart';
import 'cards.dart';

Color darkGreyHexa = Color(0xff777777);

Widget menuItem(
    {required String text, required IconData icon, required BuildContext ctx}) {
  return InkWell(
    splashFactory: InkSplash.splashFactory,
    splashColor: Color(0xff7333333),
    onTap: () {
      print("$text clicked.");
      print(ctx);
      Navigator.pushNamed(ctx, '/$text');
    },
    onLongPress: () {
      print("long pressed");
    },
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(color: darkBlueHex, fontWeight: FontWeight.w500),
          ),
          Icon(
            icon,
            color: darkBlueHex,
          ),
        ],
      ),
    ),
  );
}

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Material(
            color: darkgreyHex,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Image(image: AssetImage("assets/autmun_road.jpg")),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      splashFactory: InkSplash.splashFactory,
                      splashColor: Color(0xff7333333),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Feeds();
                        }));
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Feeds",
                              style: TextStyle(
                                  color: darkBlueHex,
                                  fontWeight: FontWeight.w500),
                            ),
                            Icon(
                              Icons.feed,
                              color: darkBlueHex,
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      splashFactory: InkSplash.splashFactory,
                      splashColor: Color(0xff7333333),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ProgramsPage();
                        }));
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Events",
                              style: TextStyle(
                                  color: darkBlueHex,
                                  fontWeight: FontWeight.w500),
                            ),
                            Icon(
                              Icons.event,
                              color: darkBlueHex,
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      splashFactory: InkSplash.splashFactory,
                      splashColor: Color(0xff7333333),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Quiz();
                        }));
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Questions",
                              style: TextStyle(
                                  color: darkBlueHex,
                                  fontWeight: FontWeight.w500),
                            ),
                            Icon(
                              Icons.quiz,
                              color: darkBlueHex,
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      splashFactory: InkSplash.splashFactory,
                      splashColor: Color(0xff7333333),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Feeds();
                        }));
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Archived",
                              style: TextStyle(
                                  color: darkBlueHex,
                                  fontWeight: FontWeight.w500),
                            ),
                            Icon(
                              Icons.archive,
                              color: darkBlueHex,
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      splashFactory: InkSplash.splashFactory,
                      splashColor: Color(0xff7333333),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Login();
                        }));
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Log-out",
                              style: TextStyle(
                                  color: darkBlueHex,
                                  fontWeight: FontWeight.w500),
                            ),
                            Icon(
                              Icons.logout,
                              color: darkBlueHex,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    menuItem(
                      text: "settings",
                      icon: Icons.settings,
                      ctx: context,
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
