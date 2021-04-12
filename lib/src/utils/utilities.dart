import 'dart:io';

import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

class Utilities {
  static Future<bool> isInternetConnected() async {
    try {
      return await InternetAddress.lookup('www.google.com.pk')
          .then((response) => response.isNotEmpty);
    } catch (e) {
      return false;
    }
  }
mySnackBar(String title, String body){
    return Get.snackbar(title, body,snackPosition: SnackPosition.BOTTOM);
}
}
