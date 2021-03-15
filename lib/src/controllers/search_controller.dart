import 'package:get/get.dart';

class SearchController extends GetxController {
  // RxList<String> searchTypesList =
  //     ['stores'.toString().tr + '(50)', 'items'.toString().tr + '(3)'].obs;
  RxInt selectedIndex = 0.obs;

  changeValue(int index) {
    selectedIndex.value = index;
    print(selectedIndex.value);
  }
}
