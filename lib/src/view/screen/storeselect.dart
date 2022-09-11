import 'package:JustDM/src/controller/store_select_controller.dart';
import 'package:JustDM/src/view/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'GradientButton.dart';
import 'SelectStoreELements/SplashContent.dart';

final StoreSelectController controller = Get.put(StoreSelectController());

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
    {"text": "Maggi Hotspot", "image": "assets/maggihotspot.jpg"},
    {"text": "Kathi House", "image": "assets/maggihotspot.jpg"},
    {"text": "Chai OK", "image": "assets/maggihotspot.jpg"},
    {"text": "Quench", "image": "assets/maggihotspot.jpg"},
    {"text": "Tuck Shop", "image": "assets/maggihotspot.jpg"},
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
                  controller.currentPage.value = value;
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"].toString(),
                  text: splashData[index]["text"].toString(),
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
                    onPressed: () {
                      Get.offAll(const HomeScreen(), arguments: [
                        controller.getCurrentStoreCode().toString()
                      ]);
                    },
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

  Obx buildDot({required int index}) {
    return Obx(() {
      return AnimatedContainer(
        duration: kAnimationDuration,
        margin: const EdgeInsets.only(right: 5),
        height: 6,
        width: controller.currentPage.value == index ? 20 : 6,
        decoration: BoxDecoration(
          color: controller.currentPage.value == index
              ? kPrimaryColor
              : const Color(0xFFD8D8D8),
          borderRadius: BorderRadius.circular(3),
        ),
      );
    });
  }
}
