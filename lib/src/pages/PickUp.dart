import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/src/images_path.dart';
import 'package:getx_app/src/items/components.dart';
import 'package:getx_app/src/items/food_item_bottomsheet.dart';
import 'package:getx_app/temp_data.dart';

// class PickUp extends StatelessWidget {
//   final Components components = Components();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: Padding(
//         padding: const EdgeInsets.only(top: 10),
//         child: FloatingActionButton(
//           backgroundColor: Colors.white,
//           child: Icon(Icons.location_searching, color: Colors.black),
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
//       body: Stack(
//         alignment: Alignment.bottomCenter,
//         children: [
//           Container(
//             height: double.infinity,
//             width: double.infinity,
//             color: Colors.grey.withOpacity(.5),
//             alignment: Alignment.center,
//             child: Text('Map Here'),
//           ),
//           Container(
//             height: Get.mediaQuery.size.height * 0.35,
//             width: double.infinity,
//             decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(15),
//                   topRight: Radius.circular(15),
//                 )),
//             child: Column(
//               children: [
//                 SizedBox(height: 10),
//                 Container(
//                   height: 5,
//                   width: 70,
//                   decoration: BoxDecoration(
//                     color: Colors.grey.withOpacity(.5),
//                     borderRadius: BorderRadius.circular(50),
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 components.textWithWidget('restaurants_nearby'.tr),
//                 SizedBox(height: 15),
//                 Container(
//                   height: 180,
//                   width: double.infinity,
//                   padding: EdgeInsets.symmetric(horizontal: Constants.APP_HORIZONTAL_WIDTH),
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Container(
//                                 height: 150,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(5),
//                                     image: DecorationImage(
//                                         image: AssetImage(ImagesPath.uploadFileIcon)))),
//                           ),
//                           SizedBox(width: Constants.APP_HORIZONTAL_WIDTH),
//                           Expanded(
//                             child: Container(
//                                 height: 150,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(5),
//                                     image: DecorationImage(
//                                         image: AssetImage(ImagesPath.uploadFileIcon)))),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class PickUp extends StatelessWidget {
  final GlobalKey<ExpandableBottomSheetState> bottomSheetKey = new GlobalKey();
  final Components components = Components();

  // ExpansionStatus _expansionStatus = ExpansionStatus.contracted;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExpandableBottomSheet(
          key: bottomSheetKey,
          background: GestureDetector(
            onTap: () {
              bottomSheetKey.currentState.contract();
            },
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.grey.withOpacity(.5),
              alignment: Alignment.center,
              child: Text('Map Here'),
            ),
          ),
          persistentHeader: Container(
            color: Colors.white,
            height: 50,
            child: Center(
              child: Container(
                height: 7,
                width: 70,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.5),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ),
          expandableContent: Container(
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(height: 20),
                components.textWithWidget('restaurants_nearby'.tr),
                SizedBox(height: 15),
                for (int i = 0; i < 2 /*TempData.tempFoodItems.length*/; i++)
                  FoodItemBottomSheet(
                    TempData.tempRestaurantsWithFoods[0].restaurantFoods[i],
                    TempData.tempRestaurantsWithFoods[0],
                  ),
                // FoodItemBottomSheet(
                //     TempData.tempFoodItems[i]['food'].name,
                //     TempData.tempFoodItems[i]['cuisines'],
                //     TempData.tempFoodItems[i]['image'],
                //     11,
                //     200),
                // FoodItemBottomSheet('Lucky\'s Breakfast Diner', 'Breakfast, Comfort Food',
                //     ImagesPath.uploadFileIcon, 11, 200),
              ],
            ),
          )),
    );
  }
}
