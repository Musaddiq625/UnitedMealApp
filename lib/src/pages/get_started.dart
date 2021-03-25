import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/src/const.dart';
import 'package:getx_app/src/controllers/get_started_controller.dart';
import 'package:getx_app/src/items/active_dots.dart';
import 'package:getx_app/src/items/button_widget_round.dart';
import 'package:getx_app/src/items/components.dart';
import 'package:getx_app/src/pages/login.dart';

import 'signup.dart';

class GetStartedPage extends StatelessWidget {
  final GetStartedController getStartedController = Get.put(GetStartedController());
  final Components components = Components();


  infoBox(IconData headingIcon, String headingText, String paragraphText,
      {bool isHavingShadow = false}) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.withOpacity(.5)),
          boxShadow: [
            isHavingShadow
                ? BoxShadow(color: Colors.grey.withOpacity(.5), offset: Offset(1.2, 2.2))
                : BoxShadow()
          ]),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(headingIcon, size: 30),
          SizedBox(height: 8),
          Text(headingText ?? 'headingText',
              textScaleFactor: 1.1,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text(
            paragraphText ?? 'paragraphText',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  infoBoxBullets(String headingText, List<String> pointsTextList) {
    return Container(
      width: Get.size.width * 0.7,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.withOpacity(.5)),
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(.5), offset: Offset(1.2, 2.2))]),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.star_border, size: 20),
              SizedBox(width: 5),
              Text(headingText,
                  textScaleFactor: 1.1, style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 15),
          for (int i = 0; i < pointsTextList.length; i++)
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('•', textScaleFactor: 1.2),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(pointsTextList[i], textScaleFactor: 1.1),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: Constants.APP_HORIZONTAL_WIDTH, vertical: 10),
            decoration:
                BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black, width: .3))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.menu),
                Text('LOGO'),
                components.roundButton('log_in'.tr, () {
                  Get.to(()=>Login());
                })
              ],
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text('why_delivery_with_door_dash'.tr,
                textScaleFactor: 2.7,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 50),
          CarouselSlider(
            options: CarouselOptions(
                height: 230,
                viewportFraction: 0.6,
                disableCenter: true,
                enlargeCenterPage: false,
                enableInfiniteScroll: false,
                onPageChanged: (page, _) {
                  print('page $page');
                  getStartedController.changeIndex1Value(page);
                }),
            items: [
              for (int i = 0; i < 4; i++) //infoBox()
                Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: infoBox(
                      getStartedController.list1[i]['icon'],
                      getStartedController.list1[i]['heading'],
                      getStartedController.list1[i]['paragraph'],
                    )),
            ],
          ),
          SizedBox(height: 10),
          Obx(() => ActivePoints(
              getStartedController.list1.length, getStartedController.currentIndex1.value)),
          SizedBox(height: 30),
          Container(
            width: double.infinity,
            color: Constants.GREY_COLOR.withOpacity(.4),
            child: Column(
              children: [
                SizedBox(height: 20),
                Center(
                  child: Text('sign_up_details'.tr,
                      textScaleFactor: 2.5,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 20),
                CarouselSlider(
                    options: CarouselOptions(
                        height: 250,
                        viewportFraction: 0.7,
                        disableCenter: true,
                        enlargeCenterPage: false,
                        enableInfiniteScroll: false,
                        onPageChanged: (page, _) {
                          print('page $page');
                          getStartedController.changeIndex2Value(page);
                        }),
                    items: [
                      for (int i = 0; i < getStartedController.list2.length; i++) //infoBox()
                        Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: infoBoxBullets(getStartedController.list2[i]['heading'], [
                              for (int j = 0;
                                  j < getStartedController.list2[i]['points'].length;
                                  j++)
                                getStartedController.list2[i]['points'][j]
                            ]))
                    ]),
                SizedBox(height: 10),
                Obx(() => ActivePoints(
                    getStartedController.list2.length, getStartedController.currentIndex2.value)),
                SizedBox(height: 20),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ButtonWidgetRound(
                    'get_started'.toString().tr,
                    radius: 30,
                    btnColor: Constants.APP_DARK_COLOR,
                    function: () {
                      Get.to(SignUp());
                    },
                  ),
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ],
      )),
    ));
  }
}
