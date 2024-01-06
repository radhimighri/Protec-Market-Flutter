import 'package:get/get.dart';
import 'package:markt/screens/orders/orders_controller.dart';

class OrdersBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrdersController>(() => OrdersController());
  }
}
