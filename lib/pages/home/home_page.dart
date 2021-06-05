import 'package:flutter/material.dart';
import 'package:nlw5_trilha_flutter/core/app_colors.dart';
import 'package:nlw5_trilha_flutter/pages/challenge/challenge_page.dart';
import 'package:nlw5_trilha_flutter/pages/home/home_controller.dart';
import 'package:nlw5_trilha_flutter/pages/home/widgets/appbar/app_bar_widget.dart';
import 'package:nlw5_trilha_flutter/pages/home/widgets/level_button/level_button_widget.dart';
import 'package:nlw5_trilha_flutter/pages/home/widgets/quiz_card/quiz_card_widget.dart';

import 'home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final controller = HomeController();

  @override
  void initState() {
    super.initState();

    controller.getUser();
    controller.getQuizzes();

    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {

    if(controller.state != HomeState.success) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBarWidget(
        user: controller.user!,
      ),
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
                children: controller.quizzes!.map((e) => QuizCardWidget(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChallengePage(
                      questions: e.questions,
                      title: e.title,
                    )));
                  },
                  title: e.title,
                  completed: "${e.questionAnswered} de ${e.questions.length}",
                  percentage: e.questionAnswered / e.questions.length,
                )).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}