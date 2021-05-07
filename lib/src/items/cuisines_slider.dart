import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/src/const.dart';
import 'package:getx_app/src/controllers/food_controller.dart';
import 'package:getx_app/src/controllers/home_controller.dart';

class CuisinesSlider extends StatelessWidget {

  CuisinesSlider(this.homeController);
  final HomeController homeController;
  // final FoodController  foodController= Get.put(FoodController());
  Widget item(String imagePath, String label, bool selectedCuisine) {
    return GestureDetector(
      onTap: () => homeController.selectCuisine(label),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: 50,
                width: 50,
                child: (imagePath == '' || imagePath == null)
                    ? Icon(Icons.info_outline)
                    : Image.network(imagePath)),
          ),
          SizedBox(height: 7),
          Text(label.toString(), style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 3),
          Container(
            height: 3,
            width: 60,
            decoration: BoxDecoration(
              color: selectedCuisine ? Constants.APP_COLOR.withOpacity(.5) : Colors.white,
              borderRadius: BorderRadius.circular(5)),)
        ],
      ),
    );
  }

  // final List<Map> sliderItems = [
  //   {'label': 'Breakfast', 'image': ImagesPath.breakfast},
  //   {'label': 'Burger', 'image': ImagesPath.burger},
  //   {'label': 'Chicken', 'image': ImagesPath.chicken},
  //   {'label': 'Curry', 'image': ImagesPath.curry},
  //   {'label': 'Diet', 'image': ImagesPath.diet},
  //   {'label': 'Fast Food', 'image': ImagesPath.fastFood},
  //   {'label': 'French Fries', 'image': ImagesPath.frenchFries},
  //   {'label': 'Meatballs', 'image': ImagesPath.meatballs},
  //   {'label': 'Sandwich', 'image': ImagesPath.sandwich},
  // ];

  @override
  Widget build(BuildContext context) {
    final FoodController foodController = Get.find();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: FutureBuilder(
          future: homeController.getCuisines(),
          builder: (context, snapshot) {
            return !snapshot.hasData
                ? CircularProgressIndicator()
                :
               Row(
                      children: snapshot.data.docs
                          .map<Widget>((e) =>  Obx(() => item(e.data()['image'], e.data()['name'],
                          homeController.activeCuisines.contains(e.data()['name']))))
                          .toList(),
                    );
          }),
    );
  }
}
