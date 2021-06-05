import 'package:flutter/material.dart';
import 'package:nlw5_trilha_flutter/pages/splash/splash_page.dart';

class App extends StatelessWidget {
  const App({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "DevQuiz",
      home: SplashPage(),
    );
  }
}