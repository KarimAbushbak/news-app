import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/features/topic/view/topic_view.dart';
import '../config/dependancy_injection.dart';
import '../core/resources/manager_strings.dart';
import '../features/auth/presntaion/view/login_view.dart';
import '../features/auth/presntaion/view/register_view.dart';
import '../features/flag/presentation/view/flag_view.dart';
import '../features/home/presentation/view/home_view.dart';
import '../features/out_boarding/view/out_boarding_screen.dart';
import '../features/splash/presentaion/view/splash_screen.dart';

class Routes {
  static const String splashScreen = '/splash_screen';
  static const String languageScreen = '/language_screen';
  static const String outBoardingScreen = '/out_boarding_screen';
  static const String loginView = '/login_view';
  static const String registerView = '/register_view';
  static const String homeView = '/home_view';
  static const String flagView = '/flag_view';
  static const String topicView = '/topic_view';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        initSplash();
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.outBoardingScreen:
        initoutBoarding();
        return MaterialPageRoute(builder: (_) =>  OutBoardingScreen());
      case Routes.loginView:
        initAuth();
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.registerView:
        initAuth();
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.homeView:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case Routes.flagView:
        initFlag();
        return MaterialPageRoute(builder: (_) => const FlagView());
      case Routes.topicView:
        initTopic();
        return MaterialPageRoute(builder: (_) => const TopicView());
      // case Routes.settingView:
      //   initSetting();
      //   return MaterialPageRoute(builder: (_) =>  SettingView());
      // case Routes.detailsView:
      //   return MaterialPageRoute(builder: (_) =>  DetailsView());
      default:
        return unDefineRoute();
    }
  }

  static Route<dynamic> unDefineRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text(ManagerStrings.notFoundRoute),
        ),
      ),
    );
  }
}
