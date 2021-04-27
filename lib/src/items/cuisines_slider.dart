import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/src/controllers/food_controller.dart';

class CuisinesSlider extends StatelessWidget {
  // final FoodController  foodController= Get.put(FoodController());
  Widget item(String imagePath, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(height: 50, width: 50, child:
            (imagePath==''||imagePath==null)?
                Icon(Icons.info_outline):
            Image.network(imagePath)),
          ),
          SizedBox(height: 10),
          Text(label.toString(), style: TextStyle(fontWeight: FontWeight.bold))
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
    // print('foodController.getCuisines ${foodController.getCuisines}');
    final FoodController foodController = Get.find();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: StreamBuilder(
        stream: foodController.firebaseFunctions.getAllCuisines(),
        builder: (context, snapshot) {
// print('snapshot.data ${snapshot.data.docs[0].data()}');
          return
          !snapshot.hasData?CircularProgressIndicator():
          // snapshot.data?
          // CircularProgressIndicator():

            Row(
            children:snapshot.data.docs.map<Widget>((e) =>item(e.data()['image'], e.data()['name'])).toList(),
          );
        }
      ),
    );
  }
}
