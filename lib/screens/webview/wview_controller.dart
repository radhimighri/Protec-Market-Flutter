// ignore_for_file: avoid_print

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:get/get.dart';
import 'package:markt/globals.dart';
import 'package:markt/routes/app_routes.dart';

class MyWebViewController extends GetxController {
  var link, amount, quantity, products, date, title;

  final flutterWebviewPlugin = FlutterWebviewPlugin();

  @override
  void onInit() {
    super.onInit();
    link = Get.arguments["url"];
    amount = Get.arguments["amount"];
    quantity = Get.arguments["quantity"];
    products = Get.arguments["products"];
    date = Get.arguments["pickDate"];
    title = Get.arguments["title"];
    for (var prod in products as List<int>) {
      print(prod);
    }

    flutterWebviewPlugin.onUrlChanged.listen((url) async {
      if (url.contains(
          "http://mevdnic.cluster031.hosting.ovh.net/protech/public/api/success")) {
        print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");

        await flutterWebviewPlugin.stopLoading();
        await getPaypalResponse(url);
      }
    });

    flutterWebviewPlugin.onUrlChanged.listen((url) async {
      if (url.contains(
          "http://mevdnic.cluster031.hosting.ovh.net/protech/public/api/vr_success")) {
        print("wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww");

        await flutterWebviewPlugin.stopLoading();
        await getVrResponse(url);
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
  }

  getPaypalResponse(url) async {
    try {
      await dbService.getPaypalMiddleware(url).then((value) async {
        if (value == true) {
          await dbService.paypalSaveOrder(amount, products, quantity, date);
          cart.clear();
          Get.offAllNamed(AppRoutes.cart);
        } else {
          //showErrorSnackBar(title: "Protech", message: "Error placing order");
        }
      });
    } catch (e) {
      print(e.toString());
    }
  }

  getVrResponse(url) async {
    try {
      await dbService.vrSaveOrder(amount, products, quantity, date);
      cart.clear();
      Get.offAllNamed(AppRoutes.cart);
    } catch (e) {
      print(e.toString());
    }
  }
}
