import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hagerawi_app/components/cards.dart';
import 'package:hagerawi_app/providers/color_provider.dart';
import 'package:provider/provider.dart';

class SingleEvent extends StatefulWidget {
  final String title;
  final String author;
  final String detail;
  const SingleEvent(
      {Key? key,
      required this.title,
      required this.author,
      required this.detail})
      : super(key: key);

  static const String routeName = "/single_event";

  @override
  _SingleEventState createState() => _SingleEventState();
}

class _SingleEventState extends State<SingleEvent> {
  final colorProvider = ColorProvider(Colors.grey.shade500);

  Color goingColor = Colors.lightBlue.shade500;
  Color darkBlueHex = Colors.grey.shade500;
  Color darkgreyHex = Color(0xff777777);
  Color warmOrangeHex = Color(0xffccc5b9);
  Color warmOrangeHexBtn = Color(0xffccc5b9);
  Color ligthOrangeHex = Color(0xffF4A261);
  Color yellowtext = Colors.yellow;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ChangeNotifierProvider<ColorProvider>(
          create: (context) => colorProvider,
          child: Scaffold(
            backgroundColor: darkgreyHex,
            // drawer: Navbar(),

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
                            // Expanded(
                            //   child: ListView.builder(
                            //     physics: BouncingScrollPhysics(),
                            //     itemCount: 1,
                            //     itemBuilder: (BuildContext context, i) {
                            //       return CommentInputField("hint");
                            //     },
                            //   ),
                            // ),
                            SizedBox(height: 10),
                            Consumer<ColorProvider>(
                                builder: (context, state, _) {
                              return Expanded(
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: state.color,
                                        padding: EdgeInsets.all(20)),
                                    onPressed: () {
                                      // feedBloc.add(FetchFeedsEvent());
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return SingleEvent(
                                            title: "Title",
                                            author: "@author",
                                            detail: "detailed");
                                      }));
                                    },
                                    child: Text(
                                      "Attending",
                                      style: TextStyle(
                                          color: Colors.blueGrey.shade800),
                                    ),
                                  ),
                                ),
                              );
                            }),

                            SizedBox(height: 10),
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.blueGrey,
                                            padding: EdgeInsets.all(20)),
                                        onPressed: () {
                                          // feedBloc.add(FetchFeedsEvent());
                                          colorProvider
                                              .changeColor(Colors.green);
                                        },
                                        child: Text("Yes, I'm going"),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.blueGrey,
                                            padding: EdgeInsets.all(20)),
                                        onPressed: () {
                                          colorProvider.changeColor2(
                                            Colors.grey.shade500,
                                          );
                                        },
                                        child: Text("No, I'm not going"),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
