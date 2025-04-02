import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:news/features/out_boarding/controller/out-boarding_controller.dart';
import '../core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';
import '../features/auth/presntaion/controller/auth_controller.dart';
import '../features/splash/presentaion/controller/splash_controller.dart';

initModule() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppSettingsSharedPreferences().initPreferences();
  await Firebase.initializeApp();

}
initSplash() {
  Get.put<SplashController>(SplashController());
}

disposeSplash() {
  Get.delete<SplashController>();
}

initoutBoarding() {
  Get.put<OutBoardingController>(OutBoardingController());
}

disposeOutBoarding() {
  Get.delete<OutBoardingController>();
}

initAuth() {
  disposeSplash();

  Get.put<AuthController>(AuthController());
}
//
// disposeAuth() {
//   Get.delete<AuthController>();
// }
// initHome() {
//   disposeSplash();
//
//   Get.put<HomeController>(HomeController());
// }
// initLocale(){
//   Get.put<LocaleNotifierController>(LocaleNotifierController());
// }
