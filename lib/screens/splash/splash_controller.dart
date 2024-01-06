import 'package:get/get.dart';
import 'package:markt/globals.dart';
import 'package:markt/routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    await dbService.getCategories();
    await dbService.getProducts();
    token = await sharedPreferenceService.getString("_token");
    if (token != null) {
      user = await dbService.getUser(token);
    }
    Get.offAllNamed(AppRoutes.home);
  }
}
