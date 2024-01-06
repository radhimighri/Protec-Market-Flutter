import 'package:get/get.dart';
import 'package:markt/screens/order-details/order_details_controller.dart';

class OrderDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderDetailsController>(() => OrderDetailsController());
  }
}
