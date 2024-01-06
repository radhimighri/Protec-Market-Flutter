import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutController extends GetxController {
  contactUs() {
    launch("mailto:seyf.yagoub@gmail.com?subject=PROTECH");
  }
}
