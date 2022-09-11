import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'RegisterPageElements/RegisterCard.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffcf0d6),
      body: ResponsiveBuilder(
        breakpoints:
            const ScreenBreakpoints(tablet: 550, desktop: 800, watch: 300),
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
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 70,
                                ),
                                const Image(
                                  height: 100,
                                  image: AssetImage(
                                    "assets/logo1.png",
                                  ),
                                  fit: BoxFit.fill,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                    "Welcome to \nJustDM\nThe Delivery Machine ",
                                    style: TextStyle(
                                        height: 1.3,
                                        fontFamily: "Metrisch-ExtraBold",
                                        fontSize: 30)),
                                const SizedBox(
                                  height: 25,
                                ),
                                Container(
                                  width: 250,
                                  child: const Text(
                                    "Just Delivery Machine. \nBe it Emergency, laziness or you being busy. But order vale bhaiya will call you and say Gate pe aajao, AND You can’t. \nWait we can; le aaye kya? Bolo",
                                    style: TextStyle(
                                        fontFamily: "Metrisch-Medium",
                                        height: 1.5,
                                        fontSize: 15,
                                        color: Colors.black54),
                                  ),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(bottom: 1),
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1.0, color: Colors.black),
                                    ),
                                  ),
                                  // child: Text("+91 7983 737272",
                                  //     style: TextStyle(
                                  //         fontFamily: "Metrisch-ExtraBold", fontSize: 23)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(bottom: 1),
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1.0, color: Colors.black),
                                    ),
                                  ),
                                  // child: Text("+91 9827 475613",
                                  //     style: TextStyle(
                                  //         fontFamily: "Metrisch-ExtraBold", fontSize: 23)),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: const [
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
                                const SizedBox(
                                  height: 130,
                                )
                              ],
                            ),
                            Container(
                                height: MediaQuery.of(context).size.width > 1300
                                    ? 400
                                    : MediaQuery.of(context).size.width > 1150
                                        ? 300
                                        : 0,
                                child: const Image(
                                    image: AssetImage(
                                        "assets/registerpageimg.png"))),
                            const RegisterCard(),
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
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 20),
                              child: const Image(
                                height: 100,
                                image: AssetImage(
                                  "assets/logo1.png",
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("JustDM \nThe Dilvery Machine",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    height: 1.3,
                                    fontFamily: "Metrisch-ExtraBold",
                                    fontSize: 30)),
                            const SizedBox(
                              height: 25,
                            ),
                            Container(
                              width: 250,
                              child: const Text(
                                "Just Delivery Machine. \nBe it Emergency, laziness or you being busy. But order vale bhaiya will call you and say Gate pe aajao, AND You can’t. \nWait we can; le aaye kya? Bolo",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: "Metrisch-Medium",
                                    height: 1.5,
                                    fontSize: 15,
                                    color: Colors.black54),
                              ),
                            ),
                            const SizedBox(
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
                          children: const [
                            // Container(
                            //     height:
                            //     MediaQuery.of(context).size.height / 1.2,
                            //     child: Image(
                            //         fit: BoxFit.cover,
                            //         image:
                            //         AssetImage("assets/RegisterPageimg.png"))),
                            RegisterCard(),
                          ],
                        ),
                        const SizedBox(
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
