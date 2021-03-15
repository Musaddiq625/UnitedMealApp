import 'package:flutter/material.dart';
import '../images_path.dart';

class CuisinesSlider extends StatelessWidget {
  item(String imagePath, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(height: 50, width: 50, child: Image.asset(imagePath)),
          ),
          SizedBox(height: 10),
          Text(label, style: TextStyle(fontWeight: FontWeight.bold))
        ],
      ),
    );
  }

  final List<Map> sliderItems = [
    {'label': 'Breakfast', 'image': ImagesPath.breakfast},
    {'label': 'Burger', 'image': ImagesPath.burger},
    {'label': 'Chicken', 'image': ImagesPath.chicken},
    {'label': 'Curry', 'image': ImagesPath.curry},
    {'label': 'Diet', 'image': ImagesPath.diet},
    {'label': 'Fast Food', 'image': ImagesPath.fastFood},
    {'label': 'French Fries', 'image': ImagesPath.frenchFries},
    {'label': 'Meatballs', 'image': ImagesPath.meatballs},
    {'label': 'Sandwich', 'image': ImagesPath.sandwich},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: sliderItems.map<Widget>((e) => item(e['image'], e['label'])).toList(),
      ),
    );
  }
}
