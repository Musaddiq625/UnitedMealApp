import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../temp_data.dart';
import '../const.dart';
import '../images_path.dart';

class ImagesSliderFull extends StatelessWidget {
  // final String name, deliveryTime, deliveryType;
  //
  // ImagesSliderFull(this.name, this.deliveryTime, this.deliveryType);

  item(String imagePath, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Constants.APP_HORIZONTAL_WIDTH/2.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 140,
            width: 320,
            decoration: BoxDecoration(
              color:Constants.GREY_COLOR,
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(image: AssetImage(imagePath),fit: BoxFit.cover)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Container(height: 50, width: 50, child: Image.asset(imagePath)),
                // ),
                // SizedBox(height: 10),
                // Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, textScaleFactor: 1.1, style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: [Text('16' + ' min'.tr + ' • ' + 'Free Delivery')],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: TempData.tempFoodItems.map<Widget>((e) => item(e['image'], e['label'])).toList(),
      ),
    );
  }
}
