import 'package:getx_app/models/ad.dart';
import 'package:getx_app/models/food.dart';

import 'models/restaurant.dart';
import 'src/images_path.dart';

class TempData {
  static List<Ad> tempAds = [
    for (int a = 0; a < 5; a++)
      Ad(
        adText: 'D\'Agostino is on DoorDash! 20% off your order of \$35+',
        btnText: 'Start Shopping',
        deliveryTime: '1-hour delivery',
      )
  ];
  static List<Restaurant> tempRestaurantsWithFoods = [
    for (int r = 0; r < 5; r++)
      Restaurant(
          id: r,
          name: 'Restaurant $r',
          imagePath: 'assets/restaurant_images/r$r.jpg',
          ratings: 4.5,
          address: '123 Street at 456',
          cuisines: [
            'Chinese',
            'Mexican',
            'Italian',
            'Indian',
            'Thai',
          ],
          restaurantFoods: [
            for (int f = 0; f < 5; f++)
              Food(
                name: 'Food $f',
                restaurantName: 'Restaurant $r',
                imagePath: ImagesPath.tempImages[f],
                price: 30.0,
                deliveryTimeInMin: 60,
                deliveryType: 'Free Delivery',
                cuisine: f == 0
                    ? 'Chinese'
                    : f == 1
                        ? 'Mexican'
                        : f == 2
                            ? 'Italian'
                            : f == 3
                                ? 'Indian'
                                : 'Thai',
                totalRatings: 3000,
              )
          ])
  ];

  static List<Map> tempFoodItemsOLD = [
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
