import 'package:get/get.dart';
import 'package:markt/screens/product-details/product_details_controller.dart';

class ProductDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductDetailsController>(() => ProductDetailsController());
  }
}
