import 'package:e_commerce_flutter/core/app_theme.dart';
import 'package:e_commerce_flutter/src/view/screen/home_screen.dart';
import 'package:e_commerce_flutter/src/view/screen/login.dart';
import 'package:e_commerce_flutter/src/view/screen/storeselect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: StoreSelect(),
      theme: AppTheme.lightAppTheme,
    );
  }
}
