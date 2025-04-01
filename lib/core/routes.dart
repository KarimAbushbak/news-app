import 'package:flutter/material.dart';



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
      // case Routes.splashScreen:
      //   return MaterialPageRoute(builder: (_) => const SplashScreen());
      // case Routes.languagePage:
      //   return MaterialPageRoute(builder: (_) => const LanguagePage());
      // case Routes.outBoarding:
      //   return MaterialPageRoute(builder: (_) => const OutBoarding());
      // case Routes.loginView:
      //   return MaterialPageRoute(builder: (_) =>  LoginView());
      // case Routes.registerView:
      //   return MaterialPageRoute(builder: (_) =>  RegisterView());
      // case Routes.homeView:
      //   return MaterialPageRoute(builder: (_) =>  HomeView());
      // case Routes.profileView:
      //   return MaterialPageRoute(builder: (_) =>  ProfileView());
      //   case Routes.detailsView:
      //     initHome();
      //   return MaterialPageRoute(builder: (_) =>  DetailsView());
      // case Routes.localeView:
      //   initLocale();
      //
      //   return MaterialPageRoute(builder: (_) =>  LocaleView());



      default:
        return unDefineRoute();
    }
  }

  static Route<dynamic> unDefineRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(),
        body:  Center(
          child: Text("nm"),
        ),
      ),
    );
  }
}
