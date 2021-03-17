import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ScanCardController extends GetxController{
  RxList countryList = [
    'United States',
    'America',
    'Pakistan',
  ].obs;
  RxInt selectedCountry = 0.obs;
  changeCountry(int index)=>selectedCountry.value = index;
  TextEditingController creditCardController = TextEditingController();

}