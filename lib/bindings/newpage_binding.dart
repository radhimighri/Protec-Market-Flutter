import 'package:get/get.dart';
import 'package:markt/screens/webview/wview_controller.dart';

class WebViewBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyWebViewController>(() => MyWebViewController());
  }
}
