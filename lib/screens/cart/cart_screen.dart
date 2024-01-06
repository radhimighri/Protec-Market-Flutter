import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:markt/globals.dart';
import 'package:markt/routes/app_routes.dart';
import 'package:markt/screens/cart/cart_controller.dart';
import 'package:markt/styles/assets.dart';
import 'package:markt/styles/colors.dart';
import 'package:markt/styles/text_styles.dart';
import 'package:markt/widgets/app_bar_widget.dart';
import 'package:markt/widgets/bottom_app_bar.dart';
import 'package:markt/widgets/payment_bottom_sheet.dart';
import 'package:markt/widgets/buttons.dart';
import 'package:markt/widgets/cart_product_widget.dart';
import 'package:markt/widgets/snack_bar.dart';

import 'package:markt/widgets/text_field.dart';

class CartScreen extends GetView<CartController> {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<CartController>(
      init: CartController(),
      initState: (_) => {},
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                //Background
                Image.asset(
                  Assets.background,
                  width: size.width,
                  height: size.height,
                  fit: BoxFit.cover,
                ),
                BottomAppBarWidget(size: size, cart: true),
                //Content
                SizedBox(
                  width: size.width,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      //App bar
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: AppBarWidget(
                          size: size,
                          title: "Mein Warenkorb",
                          suffixIcon: Assets.notifications,
                          suffixClicked: () => {},
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      const Divider(),
                      //Products
                      Expanded(
                        child: cart.isEmpty
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Text(
                                    "Ihr Warenkorb ist leer",
                                    style: AppTextStyles.medium_20.copyWith(
                                      color: AppColors.primaryTextColor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  PrimaryButton(
                                    width: size.width * 0.6,
                                    title: "Entdecken",
                                    onClick: () {
                                      Get.offAndToNamed(
                                        AppRoutes.category,
                                      );
                                    },
                                  ),
                                ],
                              )
                            : Stack(
                                children: [
                                  ListView.builder(
                                    itemCount: cart.length,
                                    itemBuilder: (context, index) {
                                      return CarProductWidget(
                                        size: size,
                                        product: cart[index],
                                        onPlusClicked: () => {
                                          controller.addQuantity(index),
                                        },
                                        onMinusClicked: () => {
                                          controller.subtractQuantity(index),
                                        },
                                        onCrossClicked: () {
                                          controller.removeProduct(index);
                                        },
                                      );
                                    },
                                  ),
                                  //Button
                                  Positioned(
                                    bottom: 10.h,
                                    right: 0.w,
                                    left: 0.w,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15.w),
                                      child: PrimaryButton(
                                        title: "Zur Kasse gehen",
                                        onClick: () {
                                          showMyBottomSheet(
                                            context: context,
                                            height: controller.isConnected
                                                ? 700.h
                                                : 300.h,
                                            child: StatefulBuilder(
                                              builder: (BuildContext context,
                                                  StateSetter setState) {
                                                return !controller.isConnected
                                                    ? Stack(
                                                        children: [
                                                          Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                "Sie müssen sich zuerst authentifizieren!!",
                                                                style: AppTextStyles
                                                                    .medium_20
                                                                    .copyWith(
                                                                  color: AppColors
                                                                      .greenColor,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 5.h,
                                                              ),
                                                              Text(
                                                                "Sie können sich über das untere Menü, Profileinstellungen, anmelden oder ein Konto erstellen.",
                                                                style: AppTextStyles
                                                                    .medium_16
                                                                    .copyWith(
                                                                  color: AppColors
                                                                      .primaryTextColor,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Positioned(
                                                            top: 10,
                                                            right: 10,
                                                            child: InkWell(
                                                              onTap: () {
                                                                Get.back();
                                                              },
                                                              child: const Icon(
                                                                  Icons.close),
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    : ListView(
                                                        children: [
                                                          //title
                                                          AppBarWidget(
                                                            size: size,
                                                            title: "Kasse",
                                                            suffixIcon:
                                                                Assets.cross,
                                                            suffixClicked: () =>
                                                                {
                                                              Get.back(),
                                                            },
                                                          ),
                                                          SizedBox(
                                                            height: 10.h,
                                                          ),
                                                          const Divider(),
                                                          //Select method button
                                                          BottomSheetItem(
                                                            title:
                                                                "Zahlungsart",
                                                            subtitle: "",
                                                            //  true
                                                            //     ? ""
                                                            //     : controller.pmethod ==
                                                            //             PaymentMethod
                                                            //                 .none
                                                            //         ? "Methode auswählen"
                                                            //         : controller.pmethod ==
                                                            //                 PaymentMethod
                                                            //                     .onpickup
                                                            //             ? "Bei Abholung"
                                                            //             : controller.pmethod ==
                                                            //                     PaymentMethod.stripe
                                                            //                 ? "Master Card"
                                                            //                 : controller.pmethod == PaymentMethod.vr
                                                            //                     ? "Sofortuberweisung"
                                                            //                     : "Streifen",
                                                            onPressed: () {
                                                              controller
                                                                      .paymentVisibility
                                                                      .value =
                                                                  !controller
                                                                      .paymentVisibility
                                                                      .value;
                                                              controller
                                                                  .stripeVisibility
                                                                  .value = false;
                                                            },
                                                          ),
                                                          //Stripe Payment
                                                          Obx(
                                                            () => Visibility(
                                                              visible: !controller
                                                                      .paymentVisibility
                                                                      .value &&
                                                                  controller
                                                                      .stripeVisibility
                                                                      .value,
                                                              child: Form(
                                                                key: controller
                                                                    .stripeFormKey,
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    SizedBox(
                                                                      height:
                                                                          10.h,
                                                                    ),
                                                                    AppTextField(
                                                                      label:
                                                                          "Kartennummer",
                                                                      borderRadius:
                                                                          0.r,
                                                                      inputType:
                                                                          TextInputType
                                                                              .number,
                                                                      editingController:
                                                                          controller
                                                                              .cardNumberController,
                                                                      validator:
                                                                          (value) {
                                                                        if (value!
                                                                            .isEmpty) {
                                                                          return "Bitte Kartennummer eingeben";
                                                                        }
                                                                        return null;
                                                                      },
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          10.h,
                                                                    ),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        AppTextField(
                                                                          width:
                                                                              size.width * 0.41,
                                                                          label:
                                                                              "Ablaufmonat",
                                                                          borderRadius:
                                                                              0.r,
                                                                          inputType:
                                                                              TextInputType.number,
                                                                          editingController:
                                                                              controller.cardMonthExpiryController,
                                                                          validator:
                                                                              (value) {
                                                                            if (value!.isEmpty) {
                                                                              return "Bitte Ablaufmonat eingeben";
                                                                            }
                                                                            return null;
                                                                          },
                                                                        ),
                                                                        AppTextField(
                                                                          width:
                                                                              size.width * 0.41,
                                                                          label:
                                                                              "Ablaufjahr",
                                                                          borderRadius:
                                                                              0.r,
                                                                          inputType:
                                                                              TextInputType.number,
                                                                          editingController:
                                                                              controller.cardYearExpiryController,
                                                                          validator:
                                                                              (value) {
                                                                            if (value!.isEmpty) {
                                                                              return "Bitte geben Sie das Ablaufjahr ein";
                                                                            }
                                                                            return null;
                                                                          },
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          10.h,
                                                                    ),
                                                                    AppTextField(
                                                                      label:
                                                                          "CCV-Nummer",
                                                                      borderRadius:
                                                                          0.r,
                                                                      inputType:
                                                                          TextInputType
                                                                              .number,
                                                                      editingController:
                                                                          controller
                                                                              .cardCvvController,
                                                                      validator:
                                                                          (value) {
                                                                        if (value!
                                                                            .isEmpty) {
                                                                          return "Bitte CCV-Nummer eingeben";
                                                                        }
                                                                        return null;
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          //payment methods
                                                          Obx(
                                                            () => Visibility(
                                                              visible: controller
                                                                      .paymentVisibility
                                                                      .value &&
                                                                  !controller
                                                                      .stripeVisibility
                                                                      .value,
                                                              child: Column(
                                                                children: [
                                                                  //pick up
                                                                  ListTile(
                                                                    contentPadding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    title: Row(
                                                                      children: [
                                                                        Image
                                                                            .network(
                                                                          "https://cdn-icons-png.flaticon.com/128/1519/1519021.png",
                                                                          width:
                                                                              25,
                                                                        ),
                                                                        const SizedBox(
                                                                          width:
                                                                              5,
                                                                        ),
                                                                        Text(
                                                                          "Bei Abholung",
                                                                          style: AppTextStyles
                                                                              .regular_16
                                                                              .copyWith(color: AppColors.darkGreyColor),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    trailing: Radio<
                                                                        PaymentMethod>(
                                                                      activeColor:
                                                                          AppColors
                                                                              .greenColor,
                                                                      value: PaymentMethod
                                                                          .onpickup,
                                                                      groupValue:
                                                                          controller
                                                                              .pmethod,
                                                                      onChanged:
                                                                          (value) {
                                                                        controller.pmethod =
                                                                            value;
                                                                        setState(
                                                                          () {},
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                  //stripe
                                                                  ListTile(
                                                                    contentPadding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    title: Row(
                                                                      children: [
                                                                        Image
                                                                            .network(
                                                                          "https://cdn0.iconfinder.com/data/icons/major-credit-cards-colored/48/JD-15-512.png",
                                                                          width:
                                                                              35,
                                                                        ),
                                                                        const SizedBox(
                                                                          width:
                                                                              5,
                                                                        ),
                                                                        Text(
                                                                          "Master Card",
                                                                          style: AppTextStyles
                                                                              .regular_16
                                                                              .copyWith(color: AppColors.darkGreyColor),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    trailing: Radio<
                                                                        PaymentMethod>(
                                                                      activeColor:
                                                                          AppColors
                                                                              .greenColor,
                                                                      value: PaymentMethod
                                                                          .stripe,
                                                                      groupValue:
                                                                          controller
                                                                              .pmethod,
                                                                      onChanged:
                                                                          (value) {
                                                                        controller.pmethod =
                                                                            value;
                                                                        setState(
                                                                          () {},
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                  //paypal
                                                                  ListTile(
                                                                    contentPadding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    title: Row(
                                                                      children: [
                                                                        Image
                                                                            .network(
                                                                          "https://cdn-icons-png.flaticon.com/512/174/174861.png",
                                                                          width:
                                                                              25,
                                                                        ),
                                                                        const SizedBox(
                                                                          width:
                                                                              5,
                                                                        ),
                                                                        Text(
                                                                          "Paypal",
                                                                          style: AppTextStyles
                                                                              .regular_16
                                                                              .copyWith(color: AppColors.darkGreyColor),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    trailing: Radio<
                                                                        PaymentMethod>(
                                                                      activeColor:
                                                                          AppColors
                                                                              .greenColor,
                                                                      value: PaymentMethod
                                                                          .paypal,
                                                                      groupValue:
                                                                          controller
                                                                              .pmethod,
                                                                      onChanged:
                                                                          (value) {
                                                                        controller.pmethod =
                                                                            value;
                                                                        setState(
                                                                          () {},
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                  //vr
                                                                  ListTile(
                                                                    contentPadding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    title: Row(
                                                                      children: [
                                                                        Image
                                                                            .network(
                                                                          "https://user-images.githubusercontent.com/52973457/82835977-d9520b00-9ec5-11ea-8880-642813c05f24.png",
                                                                          width:
                                                                              25,
                                                                        ),
                                                                        const SizedBox(
                                                                          width:
                                                                              5,
                                                                        ),
                                                                        Text(
                                                                          "Sofortüberweisung",
                                                                          style: AppTextStyles
                                                                              .regular_16
                                                                              .copyWith(color: AppColors.darkGreyColor),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    trailing: Radio<
                                                                        PaymentMethod>(
                                                                      activeColor:
                                                                          AppColors
                                                                              .greenColor,
                                                                      value:
                                                                          PaymentMethod
                                                                              .vr,
                                                                      groupValue:
                                                                          controller
                                                                              .pmethod,
                                                                      onChanged:
                                                                          (value) {
                                                                        controller.pmethod =
                                                                            value;
                                                                        setState(
                                                                          () {},
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          const Divider(),
                                                          //Total cost
                                                          BottomSheetItem(
                                                            title:
                                                                "Gesamtkosten",
                                                            subtitle:
                                                                "€${getTotalPrice().toStringAsFixed(2)}",
                                                            onPressed: () {},
                                                            isIcon: false,
                                                          ),
                                                          const Divider(),
                                                          //PICK DATE
                                                          Obx(() {
                                                            return BottomSheetItem(
                                                              title:
                                                                  "Abholdatum",
                                                              subtitle:
                                                                  controller
                                                                      .pickDate
                                                                      .value,
                                                              onPressed: () {
                                                                showDatePicker(
                                                                  context:
                                                                      context,
                                                                  initialDate:
                                                                      DateTime.now()
                                                                          .add(
                                                                    const Duration(
                                                                      days: 1,
                                                                    ),
                                                                  ),
                                                                  firstDate:
                                                                      DateTime.now()
                                                                          .add(
                                                                    const Duration(
                                                                      days: 1,
                                                                    ),
                                                                  ),
                                                                  lastDate:
                                                                      DateTime.now()
                                                                          .add(
                                                                    const Duration(
                                                                      days:
                                                                          1000,
                                                                    ),
                                                                  ),
                                                                ).then(
                                                                  (date) {
                                                                    if (date !=
                                                                        null) {
                                                                      showTimePicker(
                                                                              context: context,
                                                                              initialTime: TimeOfDay.now())
                                                                          .then((time) {
                                                                        if (time !=
                                                                            null) {
                                                                          controller
                                                                              .pickDate
                                                                              .value = "${DateFormat("dd-MM-yyyy").format(date)} ${DateFormat("hh:mm").format(
                                                                            DateTime(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              time.hour,
                                                                              time.minute,
                                                                              0,
                                                                            ),
                                                                          )}";
                                                                          controller
                                                                              .update();
                                                                        }
                                                                      });
                                                                    }
                                                                  },
                                                                );
                                                              },
                                                            );
                                                          }),
                                                          const Divider(),
                                                          SizedBox(
                                                            height: 10.h,
                                                          ),
                                                          //Terms and conditions
                                                          Text(
                                                            "Indem Sie eine Bestellung aufgeben, stimmen Sie unseren Allgemeinen Geschäftsbedingungen zu.",
                                                            style: AppTextStyles
                                                                .regular_16
                                                                .copyWith(
                                                              color: AppColors
                                                                  .primaryTextColor,
                                                            ),
                                                          ),
                                                          //Space
                                                          Obx(
                                                            () => SizedBox(
                                                              height: controller
                                                                          .paymentVisibility
                                                                          .value ||
                                                                      controller
                                                                          .stripeVisibility
                                                                          .value
                                                                  ? 65.h
                                                                  : 280.h,
                                                            ),
                                                          ),
                                                          //Button
                                                          Obx(
                                                            () {
                                                              return PrimaryButton(
                                                                title: controller.pmethod == PaymentMethod.stripe ||
                                                                        controller.pmethod ==
                                                                            PaymentMethod
                                                                                .paypal ||
                                                                        controller.pmethod == PaymentMethod.vr &&
                                                                            controller.pickDate.value !=
                                                                                "Datum auswählen"
                                                                    ? "Fortfahren"
                                                                    : "Bestellung aufgeben",
                                                                btnActivated: controller.pmethod ==
                                                                            PaymentMethod
                                                                                .none ||
                                                                        controller.pickDate.value ==
                                                                            "Datum auswählen"
                                                                    ? false
                                                                    : true,
                                                                processing:
                                                                    controller
                                                                        .isProcessing
                                                                        .value,
                                                                onClick: () {
                                                                  controller
                                                                      .placeOrder();
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      );
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                      ),
                      SizedBox(
                        height: 90.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
