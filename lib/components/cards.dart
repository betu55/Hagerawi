import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hagerawi_app/feed/feed_bloc.dart';
import 'package:hagerawi_app/feed/feed_model.dart';
import 'package:hagerawi_app/pages/feeds_post.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Color darkBlueHex = Color(0xff023047);
Color darkgreyHex = Color(0xff777777);
Color warmOrangeHex = Color(0xffccc5b9);
Color warmOrangeHexBtn = Color(0xffccc5b9);
Color ligthOrangeHex = Color(0xffF4A261);

class TheCard extends StatefulWidget {
  const TheCard({Key? key}) : super(key: key);

  @override
  _TheCardState createState() => _TheCardState();
}

class _TheCardState extends State<TheCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12, right: 10, left: 10),
      child: Material(
        color: Colors.grey.shade500,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
            borderRadius: BorderRadius.circular(10),
            splashColor: Colors.blueGrey.withAlpha(100),
            splashFactory: InkSplash.splashFactory,
            onTap: () {
              print("pressed");
            },
            child: Container(
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "Title",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "# This file tracks properties of this Flutter project.This file should be version controlled This file tracks properties of this Flutter project.This file should be version controlled This file tracks properties of this Flutter project.This file should be version controlled and should not be manually edited revision: f4abaa0735eba4dfd8f33f73363911d63931fe03channel: stableproject_type: app",
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "@author_name",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            )),
      ),
    );
  }
}
