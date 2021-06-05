import 'package:flutter/material.dart';
import 'package:nlw5_trilha_flutter/core/app_gradients.dart';
import 'package:nlw5_trilha_flutter/core/app_images.dart';
import 'package:nlw5_trilha_flutter/pages/home/home_page.dart';

class SplashPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 2)).then((value)
      => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage())));

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppGradients.linear
        ),
        child: Center(child: Image.asset(AppImages.logo)),
      ),
    );
  }
}