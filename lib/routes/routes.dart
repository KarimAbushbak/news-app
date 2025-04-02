import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/dependancy_injection.dart';
import '../features/auth/presntaion/view/login_view.dart';
import '../features/auth/presntaion/view/register_view.dart';

class Routes {
  static const String splashScreen = '/splash_screen';
  static const String languagePage = '/language_page';
  static const String homeView = '/homeView';
  static const String outBoarding = '/outBoarding';
  static const String loginView = '/loginView';
  static const String registerView = '/registerView';
  static const String profileView = '/profileView';
  static const String localeView = '/localeView';
  static const String detailsView = '/detailsView';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginView:
        initAuth();
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.registerView:
        initAuth();
        return MaterialPageRoute(builder: (_) => RegisterView());

      default:
        return unDefineRoute();
    }
  }

  static Route<dynamic> unDefineRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text("kkg"),
        ),
      ),
    );
  }
}
