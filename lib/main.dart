import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/routes/routes.dart';

import 'config/dependancy_injection.dart';

void main() async {
  await initModule();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.flagView,
      onGenerateRoute: RouteGenerator.getRoute,
    );
  }
}

