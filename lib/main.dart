import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:markt/services/db_service.dart';
import 'package:markt/services/shared_prefs_service.dart';

import 'routes/app_pages.dart';
import 'routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const MyApp());
}

initServices() async {
  await Get.putAsync(() => SharedPreferenceService().init());
  await Get.putAsync(() => DbService().init());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(374, 811),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          defaultTransition: Transition.noTransition,
          initialRoute: AppRoutes.splash,
          getPages: AppPages.pages,
        );
      },
    );
  }
}
