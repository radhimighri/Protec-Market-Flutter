import 'package:get/get.dart';

import '../../globals.dart';

class CategoryController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    print(categoriesList.length);
  }
}
