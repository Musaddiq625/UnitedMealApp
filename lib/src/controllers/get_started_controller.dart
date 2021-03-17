import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetStartedController extends GetxController {
  RxInt currentIndex1 = 0.obs, currentIndex2 = 0.obs;
  CarouselController carouselController = CarouselController();
  List list1 = [
        for (int i = 0; i < 6; i++)
          {
            'icon': Icons.search,
            'heading': 'Know how much you\'ll make',
            'paragraph':
                'Clear and concise pay model lets you know how much you will make before accepting any order.'
          }
      ],
      list2 = [
        for (int i = 0; i < 2; i++)
          {
            'heading': 'Requirements',
            'points': [
              '18 or older',
              'Any car, scooter or bicycle (in select cities)',
              'Driver\'s license number',
              'Social security number (on in United States)',
              'Final Step: consent to a background check'
            ]
          }
      ];

  changeIndex1Value(int updatedIndex) => currentIndex1.value = updatedIndex;

  changeIndex2Value(int updatedIndex) => currentIndex2.value = updatedIndex;
}
