import 'package:get/get.dart';
import 'src/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:getx_app/translations/translations.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await firebase_core.Firebase.initializeApp();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: MyTranslations(),
      locale: Locale('en'),
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'ProductSans'),
      home: SplashScreen(),
    );
  }
}
