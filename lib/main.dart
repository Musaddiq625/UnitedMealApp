import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/translations/translations.dart';
import 'src/pages/splash_screen.dart';

void main() {
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
