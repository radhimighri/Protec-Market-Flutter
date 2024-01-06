import 'package:get/get.dart';
import 'package:markt/models/category.dart';
import 'package:markt/models/order.dart';
import 'package:markt/models/product.dart';
import 'package:markt/models/user.dart';
import 'package:markt/services/db_service.dart';
import 'package:markt/services/shared_prefs_service.dart';

import 'widgets/snack_bar.dart';

DbService dbService = Get.find();
SharedPreferenceService sharedPreferenceService = Get.find();

List<Category> categoriesList = [];

List<Product> productsList = [
  // Product(
  //   id: 1,
  //   name: 'Product 1',
  //   description: 'This is product 1',
  //   price: 100,
  //   quantity: 1,
  //   picture: 'assets/images/product1.jpg',
  //   weight: 100.0,
  // ),
];

List<Product> cart = [];

List<Order> orders = [];

String? token;
User? user;

enum PaymentMethod { none, onpickup, stripe, paypal, vr }

void addToCart(Product product) {
  if (product.stock == 0) {
    showErrorSnackBar(title: "Protech", message: "Produkt ist ausverkauft!!");
  } else {
    if (!isInCart(product)) {
      cart.add(
        product.copyWith(
          id: product.id,
          description: product.description,
          quantity: product.quantity,
          price: product.price,
          name: product.name,
          picture: product.picture,
          weight: product.weight,
        ),
      );
      showSuccessSnackBar(
          title: "Protech", message: "Produkt zum Warenkorb hinzugefügt");
    } else {
      showErrorSnackBar(
          title: "Protech", message: "Produkt bereits im Warenkorb");
    }
  }
}

bool isInCart(Product product) {
  for (var prod in cart) {
    if (product.name == prod.name) {
      return true;
    }
  }
  return false;
}

double getTotalPrice() {
  double total = 0.0;
  for (var product in cart) {
    total += product.price!;
  }
  return total;
}

List<int> getProductsId() {
  List<int> ids = [];
  for (var product in cart) {
    ids.add(product.id!);
  }
  return ids;
}

List<int> getProductsQuantity() {
  List<int> quantities = [];
  for (var product in cart) {
    quantities.add(product.quantity!);
  }
  return quantities;
}
