import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentCard extends StatefulWidget {
  final String comment;
  const CommentCard({
    Key? key,
    required this.comment,
  }) : super(key: key);

  @override
  _CommentCardState createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200.withAlpha(120),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(0)),
      ),
      width: double.maxFinite,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Column(
              children: [
                Image.asset(
                  "images/pngwing.png",
                  fit: BoxFit.contain,
                  height: 30,
                  width: 30,
                ),
              ],
            ),
          ),
          Expanded(child: Text("${widget.comment}"))
        ],
      ),
    );
  }
}
