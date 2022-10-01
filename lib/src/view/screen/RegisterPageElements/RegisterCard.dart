import 'dart:async';

import 'package:JustDM/src/controller/register_controller.dart';
import 'package:JustDM/src/view/screen/storeselect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:get/get.dart';

import '../GradientButton.dart';

final RegisterController controller = Get.put(RegisterController());

class RegisterCard extends StatefulWidget {
  const RegisterCard({Key? key}) : super(key: key);

  @override
  _RegisterCardState createState() => _RegisterCardState();
}

List<String> errors = [];

String name = "";
String mobile = "";
String gender = "Female";
String hostelAddress = "";

const spinkit = SpinKitThreeInOut(
  color: Colors.white,
  size: 20.0,
);

class _RegisterCardState extends State<RegisterCard> {
  final myController = TextEditingController();
  bool Hoverforgotpass = false;
  bool Hoverdonthaveaccnt = false;
  bool Facultysignin = false;
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Container(
        padding: const EdgeInsets.all(20),
        width: 330,
        height: 470,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Register",
                style: TextStyle(
                    height: 1.3,
                    fontFamily: "Metrisch-ExtraBold",
                    fontSize: 25)),
            const SizedBox(
              height: 15,
            ),
            Container(
              child: const Text(
                "Your personal details wo'nt be shared publicly.",
                style: TextStyle(
                    fontFamily: "Metrisch-Medium",
                    height: 1.3,
                    fontSize: 15,
                    color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  color: Colors.grey.shade200,
                ),
                height: 40,
                child: TextField(
                  style: const TextStyle(
                      fontFamily: "Metrisch-Medium",
                      height: 1.5,
                      fontSize: 15,
                      color: Colors.black54),
                  onChanged: (value) {
                    name = value.trim();
                  },
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                        fontFamily: "Metrisch-Medium",
                        height: 1.5,
                        fontSize: 15,
                        color: Colors.black54),
                    hintText: 'Full Name',
                    // contentPadding:
                    // EdgeInsets.symmetric(horizontal: 20.0),
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    // ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  color: Colors.grey.shade200,
                ),
                height: 40,
                child: TextField(
                  style: const TextStyle(
                      fontFamily: "Metrisch-Medium",
                      height: 1.5,
                      fontSize: 15,
                      color: Colors.black54),
                  onChanged: (value) {
                    mobile = value.trim();
                  },
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                        fontFamily: "Metrisch-Medium",
                        height: 1.5,
                        fontSize: 15,
                        color: Colors.black54),
                    hintText: 'Mobile',
                    // contentPadding:
                    // EdgeInsets.symmetric(horizontal: 20.0),
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    // ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 7.5,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  color: Colors.grey.shade200,
                ),
                height: 40,
                child: TextField(
                  style: const TextStyle(
                      fontFamily: "Metrisch-Medium",
                      height: 1.5,
                      fontSize: 15,
                      color: Colors.black54),
                  onChanged: (value) {
                    hostelAddress = value.trim();
                  },
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                        fontFamily: "Metrisch-Medium",
                        height: 1.5,
                        fontSize: 15,
                        color: Colors.black54),
                    hintText: 'Hostel Address',
                    // contentPadding:
                    // EdgeInsets.symmetric(horizontal: 20.0),
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    // ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 7.5,
            ),
            ToggleSwitch(
              minWidth: 90.0,
              initialLabelIndex: 1,
              cornerRadius: 20.0,
              activeFgColor: Colors.white,
              inactiveBgColor: Colors.grey,
              inactiveFgColor: Colors.white,
              totalSwitches: 2,
              labels: const ['Male', 'Female'],
              animate: true,
              animationDuration: 500,
              icons: const [FontAwesomeIcons.mars, FontAwesomeIcons.venus],
              activeBgColors: const [
                [Color(0xfff2d259)],
                [Color(0xffcb7c0c)]
              ],
              onToggle: (index) {
                var indexx = index?.toInt() ?? 1;
                List<String> listx = ['Male', 'Female'];
                gender = listx[indexx];
              },
            ),
            const SizedBox(
              height: 7.5,
            ),
            Obx(() {
              return Align(
                alignment: Alignment.center,
                child: controller.loading.value == false
                    ? GradientButton(
                        title: "Continue",
                        buttonwidth: 300,
                        onPressed: () {
                          //Check for empty values and then proceed. If empty values found raise flutter toast
                          if (name == "" ||
                              mobile == "" ||
                              hostelAddress == "") {
                            Fluttertoast.showToast(
                                msg: "Please fill all the details",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.grey,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          } else if (mobile.length != 10 &&
                              !mobile.isNumericOnly) {
                            Fluttertoast.showToast(
                                msg: "Please enter valid phone number",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.grey,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          } else {
                            controller.loading.value = true;
                            var data = {
                              "address": [hostelAddress],
                              "gender": gender,
                              "mobile": mobile,
                              "name": name,
                            };
                            controller.registerUserUsingUserServices(data);

                            //  Success Flutter Toast after a 2 second delay
                            Future.delayed(const Duration(seconds: 2), () {
                              Fluttertoast.showToast(
                                  msg: "Registration Successful",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.grey,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                              controller.loading.value = false;
                              // Get.offAllNamed(Routes.HOME);
                            });
                            //  Navigate to next screen using getx
                            Get.offAll(const StoreSelect());
                          }
                        })
                    : Container(
                        height: 50,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          gradient: LinearGradient(
                              begin: const FractionalOffset(0.0, 0.0),
                              end: const FractionalOffset(1.0, 0.0),
                              colors: colors),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 8),
                        child: const Center(
                          child: spinkit,
                        ),
                      ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
