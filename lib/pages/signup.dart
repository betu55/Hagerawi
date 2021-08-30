import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hagerawi_app/main.dart';
import 'package:hagerawi_app/pages/login.dart';

const kPrimaryColor = Color(0xff777777);
const kPrimaryLightColor = Colors.white;

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            color: Colors.black,
            width: double.infinity,
            height: size.height,
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(22),
                bottomRight: Radius.circular(22)),
            child: Container(
              color: kPrimaryColor,
              // top: 0,
              // left: 0,
              child: SingleChildScrollView(
                // height: size.height * 0.5,
                // color: Colors.grey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: size.height * 0.35,
                      child: Center(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kPrimaryLightColor,
                              fontSize: 18),
                        ),
                      ),
                    ),
                    // SizedBox(height: size.height * 0.03),
                    // SvgPicture.asset(
                    //   "assets/icons/login.svg",
                    //   height: size.height * 0.35,
                    // ),
                    SizedBox(height: size.height * 0.03),
                    SizedBox(
                      width: 350,
                      child: TextField(
                        onChanged: (value) {},
                        cursorColor: kPrimaryLightColor,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.person,
                            color: kPrimaryLightColor,
                          ),
                          hintText: "Your email",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 350,
                      child: TextField(
                        obscureText: true,
                        onChanged: (value) {},
                        cursorColor: kPrimaryLightColor,
                        decoration: InputDecoration(
                          hintText: "Password",
                          icon: Icon(
                            Icons.lock,
                            color: kPrimaryLightColor,
                          ),
                          suffixIcon: Icon(
                            Icons.visibility,
                            color: kPrimaryLightColor,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: size.width * 0.6,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(29),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: kPrimaryLightColor,
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 40),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return EventsPage();
                                },
                              ),
                            );
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(color: kPrimaryColor),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    // AlreadyHaveAnAccountCheck(
                    //   press: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) {
                    //           return SignUpScreen();
                    //         },
                    //       ),
                    //     );
                    //   },
                    // ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Already have an Account ? ",
                  style: TextStyle(color: Colors.yellow),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Login();
                        },
                      ),
                    );
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: kPrimaryLightColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
