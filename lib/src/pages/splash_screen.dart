import 'package:flutter/material.dart';
import 'package:getx_app/src/const.dart';
import 'package:getx_app/src/images_path.dart';
import 'package:getx_app/src/pages/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  toNextScreenWithDelay() {
    Future.delayed(Duration(seconds: 2))
        .then((value) => Navigator.push(context, MaterialPageRoute(builder: (context) => Login())));
  }

  @override
  void initState() {
    toNextScreenWithDelay();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 120,
                width: 120,
                alignment: Alignment.center,
                child: Image.asset(
                  ImagesPath.appLogoImage,
                  filterQuality: FilterQuality.low,
                ),
              ),
              SizedBox(height: 15),
              CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Constants.APP_COLOR))
            ],
          ),
        ),
      ),
    );
  }
}
