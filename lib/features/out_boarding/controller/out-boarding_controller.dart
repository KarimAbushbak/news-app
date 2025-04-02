import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';

class OutBoardingController extends GetxController{

  AppSettingsSharedPreferences appSettingsSharedPreferences =
  AppSettingsSharedPreferences();

  late PageController pageController = PageController();

  int currentPageIndex = 0;


  bool isNotFirstPage() {
    return currentPageIndex != 0;
  }

  bool isFirstPage() {
    return currentPageIndex == 0;
  }

  bool isSecondPage() {
    return currentPageIndex == 1;
  }

  bool isThirdPage() {
    return currentPageIndex == 2;
  }

  bool isLastPage() {
    return currentPageIndex == 2;
  }

  bool isNotLastPage() {
    return currentPageIndex != 2;
  }
}