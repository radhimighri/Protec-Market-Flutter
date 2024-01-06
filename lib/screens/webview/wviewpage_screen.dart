import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:get/get.dart';
import 'package:markt/screens/webview/wview_controller.dart';
import 'package:markt/styles/colors.dart';
import 'package:markt/styles/text_styles.dart';

class MyWebViewScreen extends GetView<MyWebViewController> {
  const MyWebViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyWebViewController>(
      init: MyWebViewController(),
      initState: (_) => {},
      builder: (controller) {
        return Scaffold(
          body: controller.link != null
              ? WebviewScaffold(
                  url: controller.link,
                  appBar: AppBar(
                    backgroundColor: AppColors.greenColor,
                    title: Text(
                      controller.title,
                      style: AppTextStyles.medium_16,
                    ),
                  ),
                )
              /*WebView(
                  initialUrl: controller.link,
                  javascriptMode: JavascriptMode.unrestricted,
                  gestureNavigationEnabled: true,
                  onWebViewCreated: (WebViewController webViewController) {},
                  onPageStarted: (String url) {
                    controller.getPaypalResponse(url);
                  },
                )*/
              : const CircularProgressIndicator(
                  color: AppColors.greenColor,
                ),
        );
      },
    );
  }
}
