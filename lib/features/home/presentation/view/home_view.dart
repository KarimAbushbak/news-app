import 'package:flutter/material.dart';

import '../../../../routes/routes.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pushReplacementNamed(context, Routes.outBoardingScreen);
          },
        ),
      ),
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
