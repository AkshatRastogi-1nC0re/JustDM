import 'package:e_commerce_flutter/src/view/screen/size_config.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'GradientButton.dart';
import 'SelectStoreELements/SplashContent.dart';
import 'SelectStoreELements/selectstorecard.dart';

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
      "text": "Welcome to Bennett Hub, Let’s be Social!",
      "image": "assets/maggihotspot.jpg",
      "anim": ""
    },
    {
      "text": "Feeling shy talking to others Bennett Hub \nwill help you",
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
                itemBuilder: (context, index) =>
                    SplashContent(
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
                  SizedBox(height: 20,),
                  GradientButton(
                    title: "Get Menu",
                    buttonwidth: 300,
                    onPressed: () {

                    },
                  ),
                  SizedBox(height: 20,)
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
        margin: EdgeInsets.only(right: 5),
        height: 6,
        width: currentPage == index ? 20 : 6,
        decoration: BoxDecoration(
          color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
          borderRadius: BorderRadius.circular(3),
        ),
      );
    }

}



