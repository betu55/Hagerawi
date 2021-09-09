import 'package:flutter/material.dart';
import 'package:hagerawi_app/components/cards.dart';
import 'package:hagerawi_app/components/fields.dart';

class SingleFeed extends StatefulWidget {
  final String title;
  final String author;
  final String detail;
  const SingleFeed(
      {Key? key,
      required this.title,
      required this.author,
      required this.detail})
      : super(key: key);

  @override
  _SingleFeedState createState() => _SingleFeedState();
}

class _SingleFeedState extends State<SingleFeed> {
  final commentController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Expanded(
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
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: (MediaQuery.of(context).size.height) / 10,
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
                                          Navigator.of(context).pop();
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
                                            Icons.arrow_back,
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
                                      widget.title,
                                      // "text",
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
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      children: [
                        TheSingleCard(
                          title: "",
                          author: widget.author,
                          detailed: widget.detail,
                        ),
                        SizedBox(height: 10),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Divider(
                            color: Colors.grey.shade200.withAlpha(120),
                          ),
                        ),
                        Container(
                          // width: size.width / 2,
                          margin:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                          child: CommentInputField(
                              "leave a comment...", commentController),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Divider(
                            color: Colors.grey.shade200.withAlpha(120),
                          ),
                        ),
                        SizedBox(height: 10),
                        // Expanded(
                        //   child: ListView.builder(
                        //     physics: BouncingScrollPhysics(),
                        //     itemCount: 1,
                        //     itemBuilder: (BuildContext context, i) {
                        //       return CommentInputField("hint");
                        //     },
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
