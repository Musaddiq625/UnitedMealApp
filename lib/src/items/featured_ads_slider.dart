import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/src/controllers/user_controller.dart';
import 'package:getx_app/temp_data.dart';
import '../const.dart';
import '../images_path.dart';

class FeaturedAdsSlider extends StatelessWidget {
  final UserController userController = Get.find();
  item(String imagePath, String adText, String deliveryTimeText, String btnText,
      {Function onBtnTap}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Constants.APP_HORIZONTAL_WIDTH / 2.2),
      child: Stack(
        children: [
          Container(
            height: 130,
            width: 350,
            decoration: BoxDecoration(
              // color: Colors.grey.withOpacity(.5),
              color: Constants.GREEN_COLOR,
              borderRadius: BorderRadius.circular(5),
              // image: DecorationImage(
              //   fit: BoxFit.cover,
              //   image: AssetImage(imagePath),
              // )
            ),
          ),
          Container(
            height: 130,
            width: 350,
            decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(adText,
                        softWrap: true,
                        textScaleFactor: 1.2,
                        style: TextStyle(
                          color: Constants.TEXT_WHITE_COLOR,
                            fontWeight: FontWeight.bold, height: 1.2)),
                    Text(deliveryTimeText, style: TextStyle(
                        color: Constants.TEXT_WHITE_COLOR,fontWeight: FontWeight.bold)),
                    GestureDetector(
                      onTap: (){
                        onBtnTap();
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                              color: Colors.black54, borderRadius: BorderRadius.circular(50)),
                          child: Text(btnText,
                              textScaleFactor: 0.9,
                              style: TextStyle(
                                  color: Constants.TEXT_WHITE_COLOR, fontWeight: FontWeight.bold))),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // final List<Map> sliderItems = [
  //   {'label': 'Convenience', 'image': ImagesPath.uploadFileIcon},
  //   {'label': 'Chicken', 'image': ImagesPath.uploadFileIcon},
  //   {'label': 'Healthy', 'image': ImagesPath.uploadFileIcon},
  //   {'label': 'Breakfast', 'image': ImagesPath.uploadFileIcon},
  //   {'label': 'Dinner', 'image': ImagesPath.uploadFileIcon},
  //   {'label': 'Convenience', 'image': ImagesPath.uploadFileIcon},
  //   {'label': 'Chicken', 'image': ImagesPath.uploadFileIcon},
  //   {'label': 'Healthy', 'image': ImagesPath.uploadFileIcon},
  //   {'label': 'Breakfast', 'image': ImagesPath.uploadFileIcon},
  //   {'label': 'Dinner', 'image': ImagesPath.uploadFileIcon},
  // ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: TempData.tempFoodItems
            .map<Widget>((e) => item(
                  e['image'],
                  e['adText'],
                  e['deliveryTime'],
                  e['btnText'],onBtnTap:()=> userController.checkIsLoggedIn()
                ))
            .toList(),
      ),
    );
  }
}
