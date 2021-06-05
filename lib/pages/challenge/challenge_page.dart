import 'package:flutter/material.dart';
import 'package:nlw5_trilha_flutter/pages/challenge/challenge_controller.dart';
import 'package:nlw5_trilha_flutter/pages/challenge/widgets/next_button/next_button_widget.dart';
import 'package:nlw5_trilha_flutter/pages/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:nlw5_trilha_flutter/pages/challenge/widgets/quiz/quiz_widget.dart';
import 'package:nlw5_trilha_flutter/shared/models/question_model.dart';

class ChallengePage extends StatefulWidget {

  final List<QuestionModel> questions;

  const ChallengePage({ 
    Key? key, 
    required this.questions 
  }) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {

  final controller = ChallengeController();
  final pageController = PageController();

  @override
  void initState() {
    
    // Por conta que tem o widget ValueListenableBuilder, só vai
    // atualizar aquela parte, então posso retirar esse código que
    // iria atualizar a página toda.
    // controller.currentPageNotifier.addListener(() {
    //   setState(() {});
    // });

    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });

    super.initState();
  }

  void nextPage() {
    if(controller.currentPage < widget.questions.length)
      pageController.nextPage(
        duration: Duration(seconds: 1), 
        curve: Curves.linear,
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(102),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackButton(),
                ValueListenableBuilder<int>(
                  valueListenable: controller.currentPageNotifier, 
                  builder: (context, value, _) {
                    return QuestionIndicatorWidget(
                      currentPage: controller.currentPage,
                      length: widget.questions.length,
                    );
                  }
                )
                
              ],
            ),
          )
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.questions.map((e) => QuizWidget(
          question: e,
          onChange: nextPage,
        )).toList(),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ValueListenableBuilder<int>(
            valueListenable: controller.currentPageNotifier, 
            builder: (context, value, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if(value != widget.questions.length)
                    Expanded(
                      child: NextButtonWidget.white(
                        label: "Pular",
                        onTap: () {
                          nextPage();
                        },
                      ),
                    ),

                  if(value == widget.questions.length)
                    SizedBox(width: 7),
                  
                  if(value == widget.questions.length)
                    Expanded(
                      child: NextButtonWidget.green(
                        label: "Confirmar",
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}