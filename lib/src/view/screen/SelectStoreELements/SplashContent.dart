import 'package:flutter/material.dart';

import '../size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent(
      {required this.text, required this.image, required this.anim});
  final String text, image, anim;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          image: AssetImage(
            image,
          ),
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
