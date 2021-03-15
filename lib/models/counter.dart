import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  var _count = 0;

  int get getCounter => _count;

  incrementCounter() {
    _count++;
    notifyListeners();
  }
}
