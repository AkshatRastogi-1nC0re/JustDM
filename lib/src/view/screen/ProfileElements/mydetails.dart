import 'package:JustDM/src/view/screen/ProfileElements/profilepic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';


class MyDetails extends StatefulWidget {
  const MyDetails({Key? key}) : super(key: key);

  @override
  _MyDetailsState createState() => _MyDetailsState();
}

class _MyDetailsState extends State<MyDetails> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu1(
            text1: "Name",
            text2: "Aryan Solanki",
            icon: "assets/icons/User Icon.svg",
            press: () => {

          },
          ),
          ProfileMenu1(
            text1: "Number",
            text2: "7982916348",
            icon: "assets/icons/User Icon.svg",
            press: () => {

            },
          ),
          ProfileMenu1(
            text1: "Hostel",
            text2: "C4 - 303",
            icon: "assets/icons/User Icon.svg",
            press: () => {

            },
          ),
          ProfileMenu1(
            text1: "Gender",
            text2: "Male",
            icon: "assets/icons/User Icon.svg",
            press: () => {

            },
          ),
        ],
      ),
    );
  }
}



class ProfileMenu1 extends StatelessWidget {
  const ProfileMenu1({
    Key? key,
    required this.text1,
    required this.text2,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String text1,text2, icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: kPrimaryColor,
          padding: EdgeInsets.all(20),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Color(0xFFF5F6F9),
        ),
        onPressed: press,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text(text1)),
            Expanded(child: Text(text2,overflow: TextOverflow.ellipsis,)),
          ],
        ),
      ),
    );
  }
}
