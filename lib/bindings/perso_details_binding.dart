import 'package:get/get.dart';
import 'package:markt/screens/personal-details/perso_details_controller.dart';

class PersoDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersoDetailsController>(() => PersoDetailsController());
  }
}
