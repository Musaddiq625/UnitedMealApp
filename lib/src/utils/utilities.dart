import 'dart:io';

class Utilities {
  static Future<bool> isInternetConnected() async {
    try {
      return await InternetAddress.lookup('www.google.com.pk')
          .then((response) => response.isNotEmpty);
    } catch (e) {
      return false;
    }
  }

}
