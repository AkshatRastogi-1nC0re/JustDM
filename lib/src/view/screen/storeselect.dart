import 'package:flutter/material.dart';

import 'GradientButton.dart';
import 'SelectStoreELements/SplashContent.dart';

class StoreSelect extends StatefulWidget {
  const StoreSelect({Key? key}) : super(key: key);

  @override
  _StoreSelectState createState() => _StoreSelectState();
}

const kAnimationDuration = Duration(milliseconds: 200);
int col1 = 0;

class _StoreSelectState extends State<StoreSelect> {
  static const kPrimaryColor = Color(0xff59b24d);

  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to JustDM, Let’s order food!",
      "image": "assets/maggihotspot.jpg",
      "anim": ""
    },
    {
      "text": "Feeling shy placing your order JustDM \nwill help you",
      "image": "assets/images/init2.png",
      "anim": ""
    },
    {
      "text": "Find the right people for you at Bennett",
      "image": "assets/images/init3.png",
      "anim": ""
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Stack(
            children: <Widget>[
              PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => const SplashContent(
                  image: "assets/maggihotspot.jpg",
                  text: "Maggi Hotspot",
                  anim: "",
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      splashData.length,
                      (index) => buildDot(index: index),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GradientButton(
                    title: "Get Menu",
                    buttonwidth: 300,
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
