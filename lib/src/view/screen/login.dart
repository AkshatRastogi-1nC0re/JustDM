
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'LoginPageElements/LoginCard.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffcf0d6),
      body: ResponsiveBuilder(
        breakpoints: ScreenBreakpoints(tablet: 550, desktop: 800, watch: 300),
        builder: (context, sizingInformation) {
          // Check the sizing information here and return your UI
          if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
            return Column(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 70,
                                ),
                                Image(
                                  height: 100,
                                  image: AssetImage(
                                    "assets/logo1.png",
                                  ),
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                    "Welcome to \nJustDM\nThe Delivery Machine ",
                                    style: TextStyle(
                                        height: 1.3,
                                        fontFamily: "Metrisch-ExtraBold",
                                        fontSize: 30)),
                                SizedBox(
                                  height: 25,
                                ),
                                Container(
                                  width: 250,
                                  child: Text(
                                    "Just Delivery Machine. \nBe it Emergency, laziness or you being busy. But order vale bhaiya will call you and say Gate pe aajao, AND You can’t. \nWait we can; le aaye kya? Bolo",
                                    style: TextStyle(
                                        fontFamily: "Metrisch-Medium",
                                        height: 1.5,
                                        fontSize: 15,
                                        color: Colors.black54),
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Container(
                                  padding: EdgeInsets.only(bottom: 1),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1.0, color: Colors.black),
                                    ),
                                  ),
                                  // child: Text("+91 7983 737272",
                                  //     style: TextStyle(
                                  //         fontFamily: "Metrisch-ExtraBold", fontSize: 23)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.only(bottom: 1),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1.0, color: Colors.black),
                                    ),
                                  ),
                                  // child: Text("+91 9827 475613",
                                  //     style: TextStyle(
                                  //         fontFamily: "Metrisch-ExtraBold", fontSize: 23)),
                                ),

                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.facebookF,
                                      size: 18,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    FaIcon(FontAwesomeIcons.twitter, size: 18),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    FaIcon(FontAwesomeIcons.linkedinIn,
                                        size: 18),
                                  ],
                                ),
                                SizedBox(
                                  height: 130,
                                )
                              ],
                            ),
                            Container(
                                height:MediaQuery.of(context).size.width>1300?400:MediaQuery.of(context).size.width>1150?300:0,
                                child: Image(
                                    image: AssetImage(
                                        "assets/loginpageimg.png"))),
                            LoginCard(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }

          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 20),
                              child: Image(
                                height: 100,
                                image: AssetImage(
                                  "assets/logo1.png",
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("JustDM \nThe Dilvery Machine",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    height: 1.3,
                                    fontFamily: "Metrisch-ExtraBold",
                                    fontSize: 30)),
                            SizedBox(
                              height: 25,
                            ),
                            Container(
                              width: 250,
                              child: Text(
                                "Just Delivery Machine. \nBe it Emergency, laziness or you being busy. But order vale bhaiya will call you and say Gate pe aajao, AND You can’t. \nWait we can; le aaye kya? Bolo",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: "Metrisch-Medium",
                                    height: 1.5,
                                    fontSize: 15,
                                    color: Colors.black54),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),

                            // SizedBox(height: 20,),
                            //
                            // SizedBox(height: 130,)
                          ],
                        ),
                        Stack(
                          alignment: Alignment.center,
                          clipBehavior: Clip.none,
                          children: [
                            // Container(
                            //     height:
                            //     MediaQuery.of(context).size.height / 1.2,
                            //     child: Image(
                            //         fit: BoxFit.cover,
                            //         image:
                            //         AssetImage("assets/loginpageimg.png"))),
                            LoginCard(),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}