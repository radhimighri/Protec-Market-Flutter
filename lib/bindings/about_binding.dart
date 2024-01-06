import 'package:get/get.dart';
import 'package:markt/screens/about/about_controller.dart';

class AboutBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AboutController>(() => AboutController());
  }
}
