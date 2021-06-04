import 'package:flutter/material.dart';
import 'package:nlw5_trilha_flutter/pages/home/widgets/appbar/app_bar_widget.dart';
import 'package:nlw5_trilha_flutter/pages/home/widgets/level_button/level_button_widget.dart';
import 'package:nlw5_trilha_flutter/pages/home/widgets/quiz_card/quiz_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LevelButtonWidget(
                  label: "Fácil",
                ),
                LevelButtonWidget(
                  label: "Médio",
                ),
                LevelButtonWidget(
                  label: "Difícil",
                ),
                LevelButtonWidget(
                  label: "Perito",
                ),
              ],
            ),
            SizedBox(height: 24),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16, // vertical
                crossAxisSpacing: 16, // horizontal
                children: [
                  QuizCardWidget(),
                  QuizCardWidget(),
                  QuizCardWidget()
                ],

              ),
            ),
          ],
        ),
      ),
    );
  }
}