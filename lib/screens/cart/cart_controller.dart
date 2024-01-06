import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:markt/routes/app_routes.dart';
import 'package:markt/widgets/snack_bar.dart';
import '../../globals.dart';

class CartController extends GetxController {
  PaymentMethod? pmethod = PaymentMethod.none;
  RxBool paymentVisibility = false.obs;
  RxBool stripeVisibility = false.obs;
  GlobalKey<FormState> stripeFormKey = GlobalKey<FormState>();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cardMonthExpiryController = TextEditingController();
  TextEditingController cardYearExpiryController = TextEditingController();
  TextEditingController cardCvvController = TextEditingController();
  bool isConnected = token != null;
  RxString pickDate = "Datum auswählen".obs;
  RxBool isProcessing = false.obs;
  void addQuantity(index) {
    if (cart[index].stock! > cart[index].quantity!) {
      cart[index].quantity = cart[index].quantity! + 1;
      cart[index].price = ((cart[index].price! / (cart[index].quantity! - 1)) *
          cart[index].quantity!);
      update();
    } else {
      showErrorSnackBar(
          title: "Protech",
          message: "Sie haben Ihr Produktmengenlimit erreicht!!");
    }
  }

  void subtractQuantity(index) {
    if (cart[index].quantity! >= 2) {
      cart[index].quantity = cart[index].quantity! - 1;
      cart[index].price = ((cart[index].price! / (cart[index].quantity! + 1)) *
          cart[index].quantity!);
      update();
    }
  }

  void removeProduct(index) {
    cart.removeAt(index);
    update();
  }

  placeOrder() async {
    // var newDateFormat =
    //     "${pickDate.value.substring(0, 2)}-${pickDate.value.substring(3, 5)}-${pickDate.value.substring(6, 10)}";
    var newDateFormat =
        "${pickDate.value.substring(6, 10)}-${pickDate.value.substring(3, 5)}-${pickDate.value.substring(0, 2)}";
// "2022-02-02"

    isProcessing.value = true;
    switch (pmethod) {
      case PaymentMethod.none:
        showErrorSnackBar(
            title: "Protech", message: "Bitte Zahlungsart wählen");
        break;
      case PaymentMethod.onpickup:
        //make an order
        paymentVisibility.value = false;
        try {
          await dbService.pickup(getTotalPrice().toStringAsFixed(2),
              getProductsId(), getProductsQuantity(), newDateFormat);

          cart.clear();
          Navigator.of(Get.context!).pop();

          update();
        } catch (e) {
          showErrorSnackBar(
              title: "Protech", message: "Fehler bei der Bestellung");
        }
        break;
      case PaymentMethod.paypal:

        //paypal redirection
        paymentVisibility.value = false;
        // dbService.paypal(getTotalPrice().toStringAsFixed(2), getProductsId(),
        //     getProductsQuantity());
        await dbService
            .paypal(getTotalPrice().toStringAsFixed(2))
            .then((value) => {
                  Get.toNamed(AppRoutes.webview, arguments: {
                    "url": value,
                    "amount": getTotalPrice().toStringAsFixed(2),
                    "products": getProductsId(),
                    "quantity": getProductsQuantity(),
                    "pickDate": pickDate.value,
                    "title": "PayPal Bezahlung",
                  }),
                });

        break;
      case PaymentMethod.vr:
        print(token);
        print(pickDate.value);
        //paypal redirection
        paymentVisibility.value = false;
        // dbService.paypal(getTotalPrice().toStringAsFixed(2), getProductsId(),
        //     getProductsQuantity());
        await dbService.vr(getTotalPrice().toStringAsFixed(2)).then((value) => {
              Get.toNamed(AppRoutes.webview, arguments: {
                "url": value,
                "amount": getTotalPrice().toStringAsFixed(2),
                "products": getProductsId(),
                "quantity": getProductsQuantity(),
                "pickDate": pickDate.value,
                "title": "Vr Bezahlung",
              }),
            });

        break;
      case PaymentMethod.stripe:
        if (stripeVisibility.value == true) {
          //make an order
          if (stripeFormKey.currentState!.validate()) {
            stripeVisibility.value = false;
            try {
              await dbService.stripe(
                  cardNumberController.text,
                  cardMonthExpiryController.text,
                  cardYearExpiryController.text,
                  cardCvvController.text,
                  getTotalPrice().toStringAsFixed(2),
                  getProductsId(),
                  getProductsQuantity(),
                  pickDate.value);

              cart.clear();
              Navigator.of(Get.context!).pop();

              update();
            } catch (e) {
              showErrorSnackBar(
                  title: "Protech", message: "Fehler bei der Bestellung");
            }
          }
        } else {
          stripeVisibility.value = true;
          paymentVisibility.value = false;
        }
        break;
      default:
    }
    isProcessing.value = false;
  }
}
