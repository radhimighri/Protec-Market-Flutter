import 'package:get/get.dart';
import 'package:markt/screens/auth/signin/signin_controller.dart';

class SignInBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(() => SignInController());
  }
}
