import 'package:flutter/material.dart';
import 'package:nlw5_trilha_flutter/pages/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:nlw5_trilha_flutter/pages/challenge/widgets/quiz/quiz_widget.dart';

class ChallengePage extends StatefulWidget {
  const ChallengePage({ Key? key }) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SafeArea(child: QuestionIndicatorWidget()),
      ),
      body: QuizWidget(
        title: "O que o flutter faz em sua totalidade",
      ),
    );
  }
}