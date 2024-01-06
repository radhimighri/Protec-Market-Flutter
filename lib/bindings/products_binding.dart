import 'package:get/get.dart';
import 'package:markt/screens/products/products_controller.dart';

class ProductsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductsController>(() => ProductsController());
  }
}
