// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:markt/globals.dart';
import 'package:markt/models/category.dart';
import 'package:markt/models/order.dart';
import 'package:markt/models/order_prod.dart';
import 'package:markt/models/product.dart';
import 'package:markt/models/user.dart';
import 'package:markt/services/urls.dart';
import 'package:http/http.dart' as http;
import 'package:markt/widgets/snack_bar.dart';

class DbService extends GetxService {
  static late DbService dbService;

  Future<DbService> init() async {
    dbService = Get.put(DbService());
    print("Db service initialized");
    return this;
  }

  Future<void> getCategories() async {
    print("******* GETTING CATEGORIES ********");

    Uri uri = Uri.parse(AppUrls.GET_CATEGORIES);

    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
    };

    try {
      http.Response response = await http.get(
        uri,
        headers: headers,
      );

      print("GETTING CATEGORIES \n${response.statusCode}");
      print("GETTING CATEGORIES \n${response.body}");

      if (response.statusCode == 200) {
        jsonDecode(response.body)["data"].forEach((element) {
          categoriesList.add(Category.fromJson(element));
        });
      } else if (response.statusCode == 401) {
      } else if (response.statusCode == 500) {}
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> getProducts() async {
    print("******* GETTING PRODUCTS ********");

    Uri uri = Uri.parse(AppUrls.GET_PRODUCTS);

    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
    };

    try {
      http.Response response = await http.get(
        uri,
        headers: headers,
      );

      print("GETTING PRODUCTS \n${response.statusCode}");
      print("GETTING PRODUCTS \n${response.body}");

      if (response.statusCode == 200) {
        jsonDecode(response.body)["data"].forEach((element) {
          productsList.add(Product.fromJson(element));
        });
      } else if (response.statusCode == 401) {
      } else if (response.statusCode == 500) {}
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<Product>> getProductsPerCategory(id) async {
    print("******* GETTING PRODUCTS PER CATEGORY ********");

    Uri uri = Uri.parse("${AppUrls.GET_CATEGORIES}/$id/products");

    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
    };

    try {
      http.Response response = await http.get(
        uri,
        headers: headers,
      );

      print("PRODUCTS PER CATEGORY \n${response.statusCode}");
      print("PRODUCTS PER CATEGORY \n${response.body}");

      if (response.statusCode == 200) {
        List<Product> productsPerCategory = [];
        jsonDecode(response.body)["data"].forEach((element) {
          productsPerCategory.add(Product.fromJson(element));
        });
        return productsPerCategory;
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<void> login(email, password) async {
    print("******* LOGIN ********");

    Uri uri = Uri.parse(AppUrls.LOGIN);

    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
    };

    try {
      http.Response response = await http.post(
        uri,
        headers: headers,
        body: jsonEncode(
          {
            "email": email,
            "password": password,
          },
        ),
      );

      print("LOGIN \n${response.statusCode}");
      print("LOGIN \n${response.body}");

      if (response.statusCode == 200) {
        token = jsonDecode(response.body)["token"];
        sharedPreferenceService.setString("_token", token!);
      } else if (response.statusCode == 401) {
        showErrorSnackBar(
            title: "Protech",
            message:
                "E-Mail oder Passwort falsch, bitte versuchen Sie es später erneut.");
      } else {
        showErrorSnackBar(
            title: "Protech",
            message:
                "Etwas ist schief gelaufen, bitte versuchen Sie es später erneut.");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> register(name, email, password, cpassword, phone) async {
    print("******* REGISTER ********");

    Uri uri = Uri.parse(AppUrls.REGISTER);

    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
    };

    try {
      http.Response response = await http.post(
        uri,
        headers: headers,
        body: jsonEncode(
          {
            "name": name,
            "email": email,
            "password": password,
            "c_password": cpassword,
            "phone_number": phone,
          },
        ),
      );

      print("REGISTER \n${response.statusCode}");
      print("REGISTER \n${response.body}");

      if (response.statusCode == 200) {
        token = jsonDecode(response.body)["token"];
        sharedPreferenceService.setString("_token", token!);
      } else if (response.statusCode == 401) {
        if (jsonDecode(response.body)["error"]["email"] != null) {
          showErrorSnackBar(
              title: "Protech",
              message: jsonDecode(response.body)["error"]["email"][0]);
        }
        if (jsonDecode(response.body)["error"]["password"] != null) {
          showErrorSnackBar(
              title: "Protech",
              message: jsonDecode(response.body)["error"]["password"][0]);
        }
      } else {
        showErrorSnackBar(
            title: "Protech",
            message:
                "Etwas ist schief gelaufen, bitte versuchen Sie es später erneut.");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<User?> getUser(token) async {
    print("******* GETTING USER ********");

    Uri uri = Uri.parse(AppUrls.GET_USER);

    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token",
    };

    try {
      http.Response response = await http.post(
        uri,
        headers: headers,
      );

      print("GETTING USER \n${response.statusCode}");
      print("GETTING USER \n${response.body}");

      if (response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body)["success"]);
      } else if (response.statusCode == 401) {
        token = null;
        user = null;
        sharedPreferenceService.remove("_token");
        return null;
      } else if (response.statusCode == 500) {
        return null;
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  Future<void> pickup(amount, products, quantity, date) async {
    print("******* PICKUP ********");

    Uri uri = Uri.parse(AppUrls.ORDER_PICKUP);

    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token",
    };

    try {
      http.Response response = await http.post(
        uri,
        headers: headers,
        body: jsonEncode(
          {
            "amount": amount,
            "products": products,
            "quantity": quantity,
            "pick_up_date": date,
          },
        ),
      );

      print("PICKUP \n${response.statusCode}");
      print("PICKUP \n${response.body}");

      if (response.statusCode == 200) {
        showSuccessSnackBar(
            title: "Protech", message: "Bestellung erfolgreich aufgegeben");
      } else if (response.statusCode == 401) {
      } else {
        showErrorSnackBar(
            title: "Protech",
            message:
                "Etwas ist schief gelaufen, bitte versuchen Sie es später erneut.");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> stripe(
      cardn, emonth, eyear, cvvn, amount, products, quantity, date) async {
    print("******* STRIPE ********");

    Uri uri = Uri.parse(AppUrls.ORDER_STRIPE);

    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token",
    };

    try {
      http.Response response = await http.post(
        uri,
        headers: headers,
        body: jsonEncode(
          {
            "card_no": cardn,
            "ccExpiryMonth": emonth,
            "ccExpiryYear": eyear,
            "cvvNumber": cvvn,
            "amount": amount,
            "products": products,
            "quantity": quantity,
            "pick_up_date": date,
          },
        ),
      );

      print("STRIPE \n${response.statusCode}");
      print("STRIPE \n${response.body}");

      if (response.statusCode == 200) {
        showSuccessSnackBar(
            title: "Protech", message: "Bestellung erfolgreich aufgegeben");
      } else if (response.statusCode == 401) {
      } else {
        showErrorSnackBar(
            title: "Protech",
            message:
                "Etwas ist schief gelaufen, bitte versuchen Sie es später erneut.");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<String?> paypal(amount) async {
    print("******* PAYPAL ********");

    Uri uri = Uri.parse(AppUrls.ORDER_PAYPAL);

    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token",
    };

    try {
      http.Response response = await http.post(
        uri,
        headers: headers,
        body: jsonEncode(
          {
            "amount": amount,
          },
        ),
      );

      print("paypal \n${response.statusCode}");
      print("paypal \n${response.body}");

      if (response.statusCode == 200) {
        return response.body;
      } else if (response.statusCode == 401) {
      } else {
        showErrorSnackBar(
            title: "Protech",
            message:
                "Etwas ist schief gelaufen, bitte versuchen Sie es später erneut.");
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<String?> vr(amount) async {
    print("******* VR ********");

    Uri uri = Uri.parse(AppUrls.ORDER_VR);

    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token",
    };

    try {
      http.Response response = await http.post(
        uri,
        headers: headers,
        body: jsonEncode(
          {
            "amount": amount,
          },
        ),
      );

      print("VR \n${response.statusCode}");
      print("VR body \n${response.body}");

      if (response.statusCode == 200) {
        return jsonDecode(response.body)["link"];
      } else if (response.statusCode == 401) {
      } else {
        showErrorSnackBar(
            title: "Protech",
            message:
                "Etwas ist schief gelaufen, bitte versuchen Sie es später erneut.");
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<String?> paypalSaveOrder(amount, products, quantity, date) async {
    print("******* paypalSaveOrder ********");

    Uri uri = Uri.parse(AppUrls.ORDER_PAYPAL_SAVE);

    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token",
    };

    try {
      http.Response response = await http.post(
        uri,
        headers: headers,
        body: jsonEncode(
          {
            "amount": amount,
            "products": products,
            "quantity": quantity,
            "pick_up_date": date,
          },
        ),
      );

      print("paypalSaveOrder \n${response.statusCode}");
      print("paypalSaveOrder \n${response.body}");

      if (response.statusCode == 200) {
        return response.body;
      } else if (response.statusCode == 401) {
      } else {
        showErrorSnackBar(
            title: "Protech",
            message:
                "Etwas ist schief gelaufen, bitte versuchen Sie es später erneut.");
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<String?> vrSaveOrder(amount, products, quantity, date) async {
    print("******* vrSaveOrder ********");

    Uri uri = Uri.parse(AppUrls.ORDER_VR_SAVE);

    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token",
    };

    try {
      http.Response response = await http.post(
        uri,
        headers: headers,
        body: jsonEncode(
          {
            "amount": amount,
            "products": products,
            "quantity": quantity,
            "pick_up_date": date,
          },
        ),
      );

      print("vrSaveOrder \n${response.statusCode}");
      print("vrSaveOrder \n${response.body}");

      if (response.statusCode == 200) {
        return response.body;
      } else if (response.statusCode == 401) {
      } else {
        showErrorSnackBar(
            title: "Protech",
            message:
                "Etwas ist schief gelaufen, bitte versuchen Sie es später erneut.");
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<bool> getPaypalMiddleware(link) async {
    print("******* GET PAYPAL MIDDLEWARE ********");

    Uri uri = Uri.parse(link);

    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
    };

    try {
      http.Response response = await http.get(
        uri,
        headers: headers,
      );

      print("GET PAYPAL MIDDLEWARE \n${response.statusCode}");

      if (response.statusCode == 200) {
        if (jsonDecode(response.body)["success"] != null) {
          print(jsonDecode(response.body)["success"]);
          if (jsonDecode(response.body)["success"] == true) {
            return true;
          } else {
            return false;
          }
        }
      } else if (response.statusCode == 302) {
      } else {
        showErrorSnackBar(
            title: "Protech",
            message:
                "Etwas ist schief gelaufen, bitte versuchen Sie es später erneut.");
      }
    } catch (e) {
      print(e.toString());
    }
    return false;
  }

  Future<void> getOrders() async {
    print("******* GETTING ORDERS ********");

    Uri uri = Uri.parse(AppUrls.GET_ORDERS);

    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token",
    };

    try {
      http.Response response = await http.get(
        uri,
        headers: headers,
      );

      print("GETTING ORDERS \n${response.statusCode}");
      print("GETTING ORDERS \n${response.body}");

      if (response.statusCode == 200) {
        jsonDecode(response.body)["data"].forEach((element) {
          orders.add(Order.fromJson(element));
        });
      } else if (response.statusCode == 401) {
      } else if (response.statusCode == 500) {}
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<OrderProduct>> getOrderProducts(orderId) async {
    print("******* GETTING ORDERS PRODS ********");

    Uri uri = Uri.parse("${AppUrls.GET_ORDERS}/$orderId");

    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token",
    };
    List<OrderProduct> orderProducts = [];
    try {
      http.Response response = await http.get(
        uri,
        headers: headers,
      );

      print("GETTING ORDERS PRODS \n${response.statusCode}");
      print("GETTING ORDERS PRODS \n${response.body}");

      if (response.statusCode == 200) {
        jsonDecode(response.body)["products"].forEach((element) {
          orderProducts.add(OrderProduct.fromJson(element));
        });
        return orderProducts;
      } else if (response.statusCode == 401) {
      } else if (response.statusCode == 500) {}
    } catch (e) {
      print(e.toString());
    }
    return [];
  }
}
