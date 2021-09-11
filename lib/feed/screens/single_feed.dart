import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hagerawi_app/components/cards.dart';
import 'package:hagerawi_app/components/commentcard.dart';
import 'package:hagerawi_app/components/fields.dart';
import 'package:hagerawi_app/feed/bloc/blocs.dart';
import 'package:hagerawi_app/feed/models/feed_model.dart';
import 'package:hagerawi_app/feed/repository/feed_repo.dart';

final feedRepo = FeedRepo();
final commentBloc = FeedBloc(feedRepo);

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
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myTextFieldController.dispose();
    super.dispose();
  }

  // @override
  // void initState() {
  //   super.initState();
  //   commentBloc.add(GetCommentsEvent(widget.title));
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: BlocProvider(
          create: (context) => FeedBloc(FeedRepo()),
          child: SafeArea(
            child: BlocBuilder<FeedBloc, FeedState>(
              builder: (ctx, state) {
                final commentBloc = BlocProvider.of<FeedBloc>(ctx);

                if (state is FeedCommentLoaded) {
                  List comments = state.getComments;
                  return Stack(
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
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                onTap: () {
                                                  Navigator.of(context).pop();
                                                },
                                                splashColor: Colors.blueGrey
                                                    .withAlpha(100),
                                                child: Container(
                                                  padding: EdgeInsets.all(8),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100),
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
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Container(
                                              width: double.maxFinite,
                                              child: InputField(
                                                  "Leave a comment",
                                                  myTextFieldController)),
                                        ),
                                        SizedBox(width: 5),
                                        Material(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey.shade200
                                              .withAlpha(120),
                                          child: InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              onTap: () {
                                                commentBloc.add(
                                                  GetCommentsEvent(
                                                      widget.title),
                                                );
                                                print("searching...");
                                              },
                                              splashColor: Colors.blueGrey
                                                  .withAlpha(100),
                                              child: Container(
                                                padding: EdgeInsets.all(12),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Icon(
                                                  Icons.send,
                                                  color: Colors.blueGrey,
                                                  size: 24,
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
                                Expanded(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: comments.length,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (context, i) {
                                      return CommentCard(comment: comments[i]);
                                    },
                                  ),
                                ),
                                // Center(
                                //   child: Text("$comments"),
                                // ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  );
                }

                if (state is FeedCommentLoading) {
                  return Stack(
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
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                onTap: () {
                                                  Navigator.of(context).pop();
                                                },
                                                splashColor: Colors.blueGrey
                                                    .withAlpha(100),
                                                child: Container(
                                                  padding: EdgeInsets.all(8),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100),
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
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Container(
                                              width: double.maxFinite,
                                              child: InputField(
                                                  "Leave a comment",
                                                  myTextFieldController)),
                                        ),
                                        SizedBox(width: 5),
                                        Material(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey.shade200
                                              .withAlpha(120),
                                          child: InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              onTap: () {
                                                commentBloc.add(
                                                  GetCommentsEvent(
                                                      widget.title),
                                                );
                                                print(
                                                    "searching... {${widget.title}}");
                                              },
                                              splashColor: Colors.blueGrey
                                                  .withAlpha(100),
                                              child: Container(
                                                padding: EdgeInsets.all(12),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Icon(
                                                  Icons.send,
                                                  color: Colors.blueGrey,
                                                  size: 24,
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
                                Center(
                                    child: CircularProgressIndicator(
                                  color: Colors.grey.shade200.withAlpha(120),
                                ))
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  );
                }

                return Stack(
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
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              onTap: () {
                                                Navigator.of(context).pop();
                                              },
                                              splashColor: Colors.blueGrey
                                                  .withAlpha(100),
                                              child: Container(
                                                padding: EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
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
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Container(
                                            width: double.maxFinite,
                                            child: InputField("Leave a comment",
                                                myTextFieldController)),
                                      ),
                                      SizedBox(width: 5),
                                      Material(
                                        borderRadius: BorderRadius.circular(10),
                                        color:
                                            Colors.grey.shade200.withAlpha(120),
                                        child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            onTap: () {
                                              commentBloc.add(
                                                PostCommentEvent(
                                                  myTextFieldController.text,
                                                  widget.title,
                                                ),
                                              );
                                              print(
                                                  "searching... {${widget.title}}");
                                            },
                                            splashColor:
                                                Colors.blueGrey.withAlpha(100),
                                            child: Container(
                                              padding: EdgeInsets.all(12),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Icon(
                                                Icons.send,
                                                color: Colors.blueGrey,
                                                size: 24,
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
                              Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    commentBloc.add(
                                      GetCommentsEvent(widget.title),
                                    );
                                  },
                                  child: Text("Show comments"),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
