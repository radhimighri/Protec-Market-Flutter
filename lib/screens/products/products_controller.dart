import 'package:get/get.dart';
import 'package:markt/globals.dart';
import 'package:markt/models/category.dart';

import '../../models/product.dart';

class ProductsController extends GetxController {
  Category? category;
  late List<Product> productsPerCategoryList;

  @override
  void onInit() async {
    super.onInit();
    category = Get.arguments ?? Category(id: 1, name: "All Products", logo: "");
    if (Get.arguments == null) {
      productsPerCategoryList = productsList;
      update();
    } else {
      await getProducts();
    }
  }

  getProducts() async {
    productsPerCategoryList = [];
    try {
      await dbService.getProductsPerCategory(category!.id).then(
            (data) => productsPerCategoryList.addAll(data),
          );
      update();
    } catch (e) {
      print(e.toString());
    }
  }
}
