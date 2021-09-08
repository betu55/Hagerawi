import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hagerawi_app/components/fields.dart';
import 'package:hagerawi_app/components/sidebar.dart';
import 'package:hagerawi_app/components/cards.dart';
import 'package:hagerawi_app/feed/bloc/blocs.dart';
import 'package:hagerawi_app/feed/models/feed_model.dart';
import 'package:hagerawi_app/feed/repository/feed_repo.dart';

// ignore: camel_case_types
class Feeds extends StatefulWidget {
  const Feeds({Key? key}) : super(key: key);
  static const String routeName = '/feeds';

  @override
  _FeedsState createState() => _FeedsState();
}

class _FeedsState extends State<Feeds> {
  final _myKey = GlobalKey<ScaffoldState>();
  final myTextFieldController = TextEditingController();
  String keyword = '';

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myTextFieldController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    myTextFieldController.addListener(() {
      keyword = myTextFieldController.text;
    });
  }

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
        body: BlocProvider(
          create: (context) => FeedBloc(FeedRepo()),
          child: SafeArea(
            child: BlocBuilder<FeedBloc, FeedState>(builder: (ctx, state) {
              // the first time we get to feeds page
              final feedBloc = BlocProvider.of<FeedBloc>(ctx);

              if (state is FeedsLoading) {
                feedBloc.add(FetchFeedsEvent());

                return Center(
                  child: Container(
                    alignment: Alignment.center,
                    height: double.infinity,
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
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          strokeWidth: 3,
                          color: Colors.blueGrey.shade200,
                        ),
                        SizedBox(height: 14),
                        Text(
                          "fetching feeds...",
                          style: TextStyle(
                              fontSize: 15, color: Colors.blueGrey.shade200),
                        ),
                        SizedBox(height: 14),
                      ],
                    ),
                  ),
                );
              }
              if (state is FeedsLoaded) {
                // thi is the list of feeds
                List<FeedModel> theFeeds = state.getFeeds;

                // this clears any keyword data from before searches
                // dispose();

                return Stack(
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
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              onTap: () {
                                                _myKey.currentState!
                                                    .openDrawer();
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
                                          child: InputField(
                                              "Enter a search key",
                                              myTextFieldController)),
                                      SizedBox(width: 5),
                                      Material(
                                        borderRadius: BorderRadius.circular(10),
                                        color:
                                            Colors.grey.shade200.withAlpha(120),
                                        child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            onTap: () {
                                              feedBloc.add(
                                                SearchFeedsEvent(keyword),
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
                            itemCount: theFeeds.length,
                            itemBuilder: (BuildContext context, i) {
                              return TheCard(
                                title: theFeeds[i].title,
                                description: theFeeds[i].desc,
                                author: theFeeds[i].author,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }
              if (state is FeedSearched) {
                // thi is the list of feeds
                List<FeedModel> theSearchedFeeds = state.getSearchedFeeds;

                // this clears any keyword data from before searches
                // dispose();

                return Stack(
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
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              onTap: () {
                                                _myKey.currentState!
                                                    .openDrawer();
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
                                          child: InputField(
                                              "Enter a search key",
                                              myTextFieldController)),
                                      SizedBox(width: 5),
                                      Material(
                                        borderRadius: BorderRadius.circular(10),
                                        color:
                                            Colors.grey.shade200.withAlpha(120),
                                        child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            onTap: () {
                                              feedBloc.add(
                                                SearchFeedsEvent(keyword),
                                              );
                                              // dispose();
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
                            itemCount: theSearchedFeeds.length,
                            itemBuilder: (BuildContext context, i) {
                              return TheCard(
                                title: theSearchedFeeds[i].title,
                                description: theSearchedFeeds[i].desc,
                                author: theSearchedFeeds[i].author,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }
              throw FeedsNotLoaded();
            }),
          ),
        ),
      ),
    );
  }
}
