import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hagerawi_app/pages/single_event.dart';
import 'package:hagerawi_app/feed/screens/single_feed.dart';

Color darkBlueHex = Color(0xff023047);
Color darkgreyHex = Color(0xff777777);
Color warmOrangeHex = Color(0xffccc5b9);
Color warmOrangeHexBtn = Color(0xffccc5b9);
Color ligthOrangeHex = Color(0xffF4A261);

class TheCard extends StatefulWidget {
  final String title;
  final String author;
  final String description;
  final String detailed;

  const TheCard(
      {Key? key,
      required this.title,
      required this.author,
      required this.description,
      required this.detailed})
      : super(key: key);

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
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new SingleFeed(
                            title: widget.title,
                            author: widget.author,
                            detail: widget.detailed,
                          )));
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
                      widget.title,
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      widget.description,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            widget.author,
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

class TheSingleCard extends StatefulWidget {
  final String title;
  final String author;
  final String detailed;

  const TheSingleCard(
      {Key? key,
      required this.title,
      required this.author,
      required this.detailed})
      : super(key: key);

  @override
  _TheSingleCardState createState() => _TheSingleCardState();
}

class _TheSingleCardState extends State<TheSingleCard> {
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
            // onTap: () {
            //   Navigator.push(
            //       context,
            //       new MaterialPageRoute(
            //           builder: (context) => new SingleEvent()));
            //   print("pressed");
            // },
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
                      widget.detailed,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          widget.author,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}

class SingleEventsCard extends StatefulWidget {
  final String title;
  final String author;
  final String description;
  final String detailed;

  const SingleEventsCard(
      {Key? key,
      required this.title,
      required this.author,
      required this.description,
      required this.detailed})
      : super(key: key);

  @override
  _SingleEventsCardState createState() => _SingleEventsCardState();
}

class _SingleEventsCardState extends State<SingleEventsCard> {
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
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new SingleEvent(
                            title: widget.title,
                            author: widget.author,
                            detail: widget.detailed,
                          )));
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
                      widget.title,
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      widget.description,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            widget.author,
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

class TheCommentCard extends StatefulWidget {
  final String comment;

  const TheCommentCard({
    Key? key,
    required this.comment,
  }) : super(key: key);

  @override
  _TheCommentCardState createState() => _TheCommentCardState();
}

class _TheCommentCardState extends State<TheCommentCard> {
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
            // onTap: () {
            //   Navigator.push(
            //       context,
            //       new MaterialPageRoute(
            //           builder: (context) => new SingleEvent()));
            //   print("pressed");
            // },
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
                      widget.comment,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
