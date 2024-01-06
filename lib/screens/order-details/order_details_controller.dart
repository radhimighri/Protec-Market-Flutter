import 'package:get/get.dart';
import 'package:markt/globals.dart';
import 'package:markt/models/order.dart';
import 'package:markt/models/order_prod.dart';
import 'package:markt/widgets/snack_bar.dart';

class OrderDetailsController extends GetxController {
  late Order order;
  List<OrderProduct> orderProducts = <OrderProduct>[];

  @override
  void onInit() {
    super.onInit();
    order = Get.arguments as Order;
    getProduct();
  }

  void getProduct() async {
    try {
      await dbService.getOrderProducts(order.id).then((value) {
        if (value.isNotEmpty) {
          orderProducts = value;
          update();
        } else {
          showErrorSnackBar(
              title: "PROTECH", message: "Keine Produkte gefunden");
        }
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
