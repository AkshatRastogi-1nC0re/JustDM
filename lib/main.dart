import 'package:JustDM/core/app_theme.dart';
import 'package:JustDM/src/services/user_simple_preferences.dart';
import 'package:JustDM/src/view/screen/home_screen.dart';
import 'package:JustDM/src/view/screen/register.dart';
import 'package:JustDM/src/view/screen/storeselect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserSimplePreferences.init();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyDq64xnvaT1Dk0YLVWIOpTty_9BvfTP-mE",
        appId: "1:747781775134:web:d8a81e279f792b0eadf30f",
        messagingSenderId: "747781775134",
        projectId: "justdm-f54de",
        storageBucket: "justdm-f54de.appspot.com"),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterPage(),
      theme: AppTheme.lightAppTheme,
    );
  }
}
