import 'package:flutter/material.dart';
import 'package:hagerawi_app/components/cards.dart';
import 'package:hagerawi_app/components/sidebar.dart';
import 'package:hagerawi_app/providers/color_provider.dart';
import 'package:provider/provider.dart';

class SingleEvent extends StatefulWidget {
  const SingleEvent({Key? key}) : super(key: key);
  static const String routeName = "/single_event";
  @override
  _SingleEventState createState() => _SingleEventState();
}

class _SingleEventState extends State<SingleEvent> {
  final colorProvider = ColorProvider(Color(0xff023047));

  Color goingColor = Colors.lightBlue.shade500;
  Color darkBlueHex = Color(0xff023047);
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
            drawer: Navbar(),
            appBar: AppBar(
              title: Text(
                "Events",
                style: TextStyle(color: warmOrangeHex),
              ),
              centerTitle: true,
              backgroundColor: darkBlueHex,
              backwardsCompatibility: true,
              iconTheme: IconThemeData(color: warmOrangeHex),
            ),
            body: Container(
              // height: 300,
              // width: 300,
              child: Column(
                children: [
                  TheCard(),
                  Container(
                    // width: size.width,
                    height: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            // bottomRight: Radius.circular(60),
                            topLeft: Radius.circular(30),
                          ),
                          child: Card(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Container(
                              color: darkBlueHex,
                              width: size.width * 0.3,
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "Location : ስለ ዲሲ ማዘጋጃ ቤት ቤተመፃህፍት ጥያቄዎች ካሉዎት ወደ ቢሯችን በ (202) ",
                                style: TextStyle(
                                  color: warmOrangeHex,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            // bottomRight: Radius.circular(60),
                            topLeft: Radius.circular(30),
                          ),
                          child: Card(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Container(
                              color: darkBlueHex,
                              width: size.width * 0.3,
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "Description: ቢሮዎቻችንን ሲጎበኙ ወይም ሲደውሉልን የሰራተኞቻችን አባል እርስዎን ልንረዳዎ እንድንችል በአስተርጓሚ በአካል ሊያገናኝዎት ይችላል ፡፡",
                                style: TextStyle(
                                  color: warmOrangeHex,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                // bottomRight: Radius.circular(60),
                                topLeft: Radius.circular(15),
                              ),
                              child: Card(
                                margin: EdgeInsets.only(bottom: 10),
                                child: Container(
                                  color: darkBlueHex,
                                  width: size.width * 0.3,
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    "Time: 2:30",
                                    style: TextStyle(
                                      color: warmOrangeHex,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Consumer<ColorProvider>(
                              builder: (context, state, _) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    // bottomRight: Radius.circular(60),
                                    topLeft: Radius.circular(15),
                                  ),
                                  child: Card(
                                    margin: EdgeInsets.only(bottom: 10),
                                    child: Container(
                                      color: state.color,
                                      width: size.width * 0.3,
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        "Attending",
                                        style: TextStyle(
                                          color: warmOrangeHex,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: goingColor,
                          // primary: yellowtext,
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 40),
                        ),
                        onPressed: () {
                          colorProvider.changeColor(Colors.green);
                        },
                        child: Text("Yes, I am going",
                            style: TextStyle(
                              // backgroundColor: warmOrangeHex,
                              fontWeight: FontWeight.w300,
                            )),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: goingColor,
                          // primary: yellowtext,
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 40),
                        ),
                        onPressed: () {
                          colorProvider.changeColor(Colors.red);
                        },
                        child: Text("No, I am not going",
                            style: TextStyle(
                              // backgroundColor: warmOrangeHex,
                              fontWeight: FontWeight.w300,
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
