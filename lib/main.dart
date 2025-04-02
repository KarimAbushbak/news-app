import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'config/dependancy_injection.dart';
import 'core/routes.dart';

void main() async {
  await initModule();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Routes.registerView,
      onGenerateRoute: RouteGenerator.getRoute,



    );
  }
}

