import 'package:get/get.dart';
import 'package:markt/globals.dart';
import 'package:markt/routes/app_routes.dart';

class ProfileController extends GetxController {
  bool isConnected = token != null;

  @override
  void onInit() async {
    super.onInit();
    if (isConnected) {
      user = await dbService.getUser(token);
      update();
    }
  }

  logout() {
    token = null;
    user = null;
    isConnected = false;
    sharedPreferenceService.remove("_token");
    Get.offAllNamed(AppRoutes.home);
  }
}
