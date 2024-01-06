import 'package:get/get.dart';
import 'package:markt/globals.dart';

class OrdersController extends GetxController {
  @override
  void onInit() async {
    super.onInit();

    await dbService.getOrders();
    update();
  }

  @override
  void onClose() {
    super.onClose();
    orders.clear();
  }
}
