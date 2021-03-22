import 'package:getx_app/models/food.dart';

import 'src/images_path.dart';

class TempData {
  static List<Map> tempFoodItems = [
    for (int i = 0; i < 10; i++)
      {
        'food': Food(
          name: 'Breakfast $i',
          restaurantName: 'Kolachi $i',
          imagePath: ImagesPath.tempImages[i],
          price: 30.0,
          deliveryTimeInMin: 60,
          deliveryType: 'Free Delivery',
          cuisines: ['Honey Mustard Dipping Sauce', 'Ketchup'],
          ratings: 4.5,
          totalRatings: 3000,
        ),
        'btnText': 'Start Shopping',
        'deliveryTime': '1-hour delivery',
        'adText': 'D\'Agostino is on DoorDash! 20% off your order of \$35+',
      },

    //
    //
    // {
    //   'label': 'Breakfast 2',
    //   'image': ImagesPath.tempImages[1],
    //   'btnText': 'Start Shopping',
    //   'deliveryTime': '1-hour delivery',
    //   'cuisines': 'Breakfast, Comfort Food',
    //   'adText': 'D\'Agostino is on DoorDash! 20% off your order of \$35+',
    // },
    // {
    //   'label': 'Breakfast 3',
    //   'image': ImagesPath.tempImages[2],
    //   'btnText': 'Start Shopping',
    //   'deliveryTime': '1-hour delivery',
    //   'cuisines': 'Honey Mustard Dipping Sauce, Ketchup',
    //   'adText': 'D\'Agostino is on DoorDash! 20% off your order of \$35+',
    // },
    // {
    //   'label': 'Breakfast 4',
    //   'image': ImagesPath.tempImages[3],
    //   'btnText': 'Start Shopping',
    //   'deliveryTime': '1-hour delivery',
    //   'cuisines': 'Breakfast, Comfort Food',
    //   'adText': 'D\'Agostino is on DoorDash! 20% off your order of \$35+',
    // },
    // {
    //   'label': 'Burger 1',
    //   'image': ImagesPath.tempImages[4],
    //   'btnText': 'Start Shopping',
    //   'deliveryTime': '1-hour delivery',
    //   'cuisines': 'Honey Mustard Dipping Sauce, Ketchup',
    //   'adText': 'D\'Agostino is on DoorDash! 20% off your order of \$35+',
    // },
    // {
    //   'label': 'Burger 2',
    //   'image': ImagesPath.tempImages[5],
    //   'btnText': 'Start Shopping',
    //   'deliveryTime': '1-hour delivery',
    //   'cuisines': 'Breakfast, Comfort Food',
    //   'adText': 'D\'Agostino is on DoorDash! 20% off your order of \$35+',
    // },
    // {
    //   'label': 'Chicken 1',
    //   'image': ImagesPath.tempImages[6],
    //   'btnText': 'Start Shopping',
    //   'deliveryTime': '1-hour delivery',
    //   'cuisines': 'Honey Mustard Dipping Sauce, Ketchup',
    //   'adText': 'D\'Agostino is on DoorDash! 20% off your order of \$35+',
    // },
    // {
    //   'label': 'Curry 1',
    //   'image': ImagesPath.tempImages[7],
    //   'btnText': 'Start Shopping',
    //   'deliveryTime': '1-hour delivery',
    //   'cuisines': 'Breakfast, Comfort Food',
    //   'adText': 'D\'Agostino is on DoorDash! 20% off your order of \$35+',
    // },
    // {
    //   'label': 'Meatballs 1',
    //   'image': ImagesPath.tempImages[8],
    //   'btnText': 'Start Shopping',
    //   'deliveryTime': '1-hour delivery',
    //   'cuisines': 'Honey Mustard Dipping Sauce, Ketchup',
    //   'adText': 'D\'Agostino is on DoorDash! 20% off your order of \$35+',
    // },
    // {
    //   'label': 'Meatballs 2',
    //   'image': ImagesPath.tempImages[9],
    //   'btnText': 'Start Shopping',
    //   'deliveryTime': '1-hour delivery',
    //   'cuisines': 'Breakfast, Comfort Food',
    //   'adText': 'D\'Agostino is on DoorDash! 20% off your order of \$35+',
    // },
    // {
    //   'label': 'Meatballs 3',
    //   'image': ImagesPath.tempImages[10],
    //   'btnText': 'Start Shopping',
    //   'deliveryTime': '1-hour delivery',
    //   'cuisines': 'Honey Mustard Dipping Sauce, Ketchup',
    //   'adText': 'D\'Agostino is on DoorDash! 20% off your order of \$35+',
    // },
    // {
    //   'label': 'Sandwich',
    //   'image': ImagesPath.tempImages[11],
    //   'btnText': 'Start Shopping',
    //   'deliveryTime': '1-hour delivery',
    //   'cuisines': 'Breakfast, Comfort Food',
    //   'adText': 'D\'Agostino is on DoorDash! 20% off your order of \$35+',
    // },
  ];
}
