import 'package:get/get.dart';
import 'package:markt/screens/category/category_controller.dart';

class CategoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryController>(() => CategoryController());
  }
}
