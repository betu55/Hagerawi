import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hagerawi_app/components/cards.dart';
import 'package:hagerawi_app/components/fields.dart';
import 'package:hagerawi_app/feed/bloc/blocs.dart';
import 'package:hagerawi_app/feed/models/feed_model.dart';
import 'package:hagerawi_app/feed/repository/feed_repo.dart';

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
  final myTextFieldController = TextEditingController();
  String comment = '';
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myTextFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final commentBloc = BlocProvider.of<FeedBloc>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: BlocProvider(
          create: (context) => FeedBloc(FeedRepo()),
          child: SafeArea(
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
                      height: (MediaQuery.of(context).size.height) / 5,
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
                                          borderRadius:
                                              BorderRadius.circular(20),
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
                                          color: Colors.grey.shade200
                                              .withAlpha(120),
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

                          Expanded(
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      width: 280,
                                      child: InputField("Leave a comment",
                                          myTextFieldController)),
                                  SizedBox(width: 5),
                                  Material(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.shade200.withAlpha(120),
                                    child: InkWell(
                                        borderRadius: BorderRadius.circular(10),
                                        onTap: () {
                                          commentBloc.add(
                                            FeedCommentEvent(comment),
                                          );
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
                                            Icons.comment,
                                            color: Colors.blueGrey,
                                            size: 16,
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: Divider(
                              color: Colors.grey.shade200.withAlpha(120),
                            ),
                          ),
                          SizedBox(height: 10),
                          BlocBuilder<FeedBloc, FeedState>(
                              builder: (_, feedState) {
                            if (feedState is FeedCommentLoading) {
                              return CircularProgressIndicator();
                            }
                            if (feedState is FeedCommentLoaded) {
                              List<FeedModel> comments = feedState.getComments;
                              return ListView.builder(
                                  itemCount: comments.length,
                                  itemBuilder: (_, i) {
                                    return TheCommentCard(
                                        comment: comments[i].comments);
                                  });
                            }

                            throw FeedCommentNotLoaded();
                          })
                          // Expanded(
                          //   child: ListView.builder(
                          //     physics: BouncingScrollPhysics(),
                          //     itemCount: 1,
                          //     itemBuilder: (BuildContext context, i) {
                          //       return CommentInputField(
                          //           "hint", commentController);
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
      ),
    );
  }
}
