import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/src/const.dart';
import 'package:getx_app/src/controllers/scan_card_controller.dart';
import 'package:getx_app/src/dashboard.dart';
import 'package:getx_app/src/items/components.dart';

class ScanCard extends StatelessWidget {
  final ScanCardController scanCardController = Get.put(ScanCardController());
  final Components components = Components();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(Icons.arrow_back)),
                    Text('save'.tr,
                        textScaleFactor: 1.2, style: TextStyle(
                          color: Colors.grey.withOpacity(.7),
                            fontWeight: FontWeight.bold))
                  ],
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: 100),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(border: Border.all(color: Constants.GREY_COLOR)),
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: DropdownButtonFormField(
                        value: scanCardController.selectedCountry.value,
                        icon: Icon(Icons.keyboard_arrow_down),
                        onChanged: (selectedValue) {
                          scanCardController.changeCountry(selectedValue);
                        },
                        decoration: InputDecoration(border: InputBorder.none),
                        items: [
                          for (int i = 0; i < scanCardController.countryList.length; i++)
                            DropdownMenuItem(
                                child: 
                                    Row(
                                  children: [
                                    Icon(Icons.flag_outlined),
                                    SizedBox(width: 5),
                                    Text(scanCardController.countryList[i]),
                                  ],
                                ),
                                value: i),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(border: Border.all(color: Constants.GREY_COLOR)),
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '4242_hint'.tr,
                                icon: Icon(Icons.credit_card,color: Constants.APP_COLOR)))),
                  ),
                  SizedBox(height: 35),
                  Text('scan_card_info_text'.tr,textAlign: TextAlign.center),
                  SizedBox(height: 20),
                  components.roundButton(
                      'scan_card'.tr, () {
                    Get.to(Dashboard());
                  },leadingIcon: Icons.camera_alt_outlined)
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
