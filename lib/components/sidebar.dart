import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cards.dart';

Color darkGreyHexa = Color(0xff777777);

Widget menuItem({required String text, required IconData icon}) {
  return InkWell(
    splashFactory: InkSplash.splashFactory,
    splashColor: Color(0xff7333333),
    onTap: () {
      print("$text clicked.");
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
                    menuItem(text: "Feeds", icon: Icons.feed_outlined),
                    menuItem(text: "Events", icon: Icons.event),
                    menuItem(text: "Archived", icon: Icons.archive_outlined),
                    menuItem(text: "Quiz", icon: Icons.quiz_outlined),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    menuItem(text: "Settings", icon: Icons.settings),
                    menuItem(text: "Logout", icon: Icons.logout),
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
