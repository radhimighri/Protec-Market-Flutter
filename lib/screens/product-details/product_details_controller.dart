import 'package:get/get.dart';
import 'package:markt/globals.dart';
import 'package:markt/models/product.dart';

class ProductDetailsController extends GetxController {
  Product? product;

  @override
  void onInit() {
    super.onInit();
    product = (Get.arguments as Product).copyWith(
      id: (Get.arguments as Product).id,
      description: (Get.arguments as Product).description,
      name: (Get.arguments as Product).name,
      picture: (Get.arguments as Product).picture,
      price: (Get.arguments as Product).price,
      quantity: (Get.arguments as Product).quantity,
      weight: (Get.arguments as Product).weight,
    );
  }

  void addProductToCart() {
    addToCart(product!);
    update();
  }
}
