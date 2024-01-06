import 'package:get/get.dart';
import 'package:markt/bindings/about_binding.dart';
import 'package:markt/bindings/cart_binding.dart';
import 'package:markt/bindings/category_binding.dart';
import 'package:markt/bindings/home_binding.dart';
import 'package:markt/bindings/newpage_binding.dart';
import 'package:markt/bindings/order_details_binding.dart';
import 'package:markt/bindings/orders_binding.dart';
import 'package:markt/bindings/perso_details_binding.dart';
import 'package:markt/bindings/product_details_binding.dart';
import 'package:markt/bindings/products_binding.dart';
import 'package:markt/bindings/profile_binding.dart';
import 'package:markt/bindings/signin_binding.dart';
import 'package:markt/bindings/signup_binding.dart';
import 'package:markt/bindings/splash_binding.dart';
import 'package:markt/routes/app_routes.dart';
import 'package:markt/screens/about/about_screen.dart';
import 'package:markt/screens/auth/signin/signin_screen.dart';
import 'package:markt/screens/auth/signup/signup_screen.dart';
import 'package:markt/screens/cart/cart_screen.dart';
import 'package:markt/screens/category/category_screen.dart';
import 'package:markt/screens/home/home_screen.dart';
import 'package:markt/screens/order-details/order_details_screen.dart';
import 'package:markt/screens/orders/orders_screen.dart';
import 'package:markt/screens/personal-details/perso_details_screen.dart';
import 'package:markt/screens/product-details/product_details_screen.dart';
import 'package:markt/screens/products/products_screen.dart';
import 'package:markt/screens/profile/profile_screen.dart';
import 'package:markt/screens/splash/splash_screen.dart';
import 'package:markt/screens/webview/wviewpage_screen.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.webview,
      page: () => const MyWebViewScreen(),
      binding: WebViewBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.category,
      page: () => const CategoryScreen(),
      binding: CategoryBinding(),
    ),
    GetPage(
      name: AppRoutes.cart,
      page: () => const CartScreen(),
      binding: CartBinding(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfileScreen(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.productdetails,
      page: () => const ProductDetailsScreen(),
      binding: ProductDetailsBinding(),
    ),
    GetPage(
      name: AppRoutes.products,
      page: () => const ProductsScreen(),
      binding: ProductsBinding(),
    ),
    GetPage(
      name: AppRoutes.signin,
      page: () => const SignInScreen(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => const SignUpScreen(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: AppRoutes.persodetails,
      page: () => const PersoDetailsScreen(),
      binding: PersoDetailsBinding(),
    ),
    GetPage(
      name: AppRoutes.orders,
      page: () => const OrdersScreen(),
      binding: OrdersBinding(),
    ),
    GetPage(
      name: AppRoutes.about,
      page: () => const AboutScreen(),
      binding: AboutBinding(),
    ),
    GetPage(
      name: AppRoutes.orderdetails,
      page: () => const OrderDetailsScreen(),
      binding: OrderDetailsBinding(),
    ),
  ];
}
