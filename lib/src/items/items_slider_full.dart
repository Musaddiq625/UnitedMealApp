import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/database/get_firebase_data.dart';
import 'package:getx_app/src/controllers/user_controller.dart';
import 'package:getx_app/src/pages/food_item_add_to_order.dart';
import '../../temp_data.dart';
import '../const.dart';
class ImagesSliderFull extends StatelessWidget {
  final UserController userController = Get.find();
final FirebaseFunctions firebaseFunctions;
  ImagesSliderFull(this.firebaseFunctions);
  item(String imagePath, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Constants.APP_HORIZONTAL_WIDTH / 2.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 140,
            width: 320,
            decoration: BoxDecoration(
                color: Constants.GREY_COLOR,
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(image: NetworkImage(imagePath), fit: BoxFit.cover)),

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
      child: StreamBuilder(
        stream: firebaseFunctions.getAllFoods(),
        builder: (context, snapshot) {
          return !snapshot.hasData?CircularProgressIndicator(): Row(children:
          snapshot.data.docs.map<Widget>((data) {
            // print( 'data.data() ${data.data()}');
            return
              GestureDetector(
                  onTap: () => Get.to(() => FoodItemAddToOrder(
                    data,
                  )),
                  child: item(data.data()['image'],
                      data.data()['label']));
          }).toList()
          );
        }
      ),
    );
  }
}
