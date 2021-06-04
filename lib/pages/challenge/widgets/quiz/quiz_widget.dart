import 'package:flutter/material.dart';
import 'package:nlw5_trilha_flutter/core/app_text_styles.dart';
import 'package:nlw5_trilha_flutter/pages/challenge/widgets/answer/answer_widget.dart';

class QuizWidget extends StatelessWidget {

  final String title;

  const QuizWidget({ Key? key, required this.title }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "Título da pergunta a qual está sendo perguntada",
              style: AppTextStyles.heading,
            ),
          ),
          SizedBox(
            height: 24
          ),
          AnswerWidget(
            title: "Possibilita a criação de componentes rederizados nativamente?",
            isRight: true,
            isSelected: true,
          ),
          AnswerWidget(
            title: "Possibilita a criação de componentes rederizados nativamente?",
            isSelected: true,
          ),
          AnswerWidget(
            title: "Possibilita a criação de componentes rederizados nativamente?"
          ),
          AnswerWidget(
            title: "Possibilita a criação de componentes rederizados nativamente?"
          ),
          AnswerWidget(
            title: "Possibilita a criação de componentes rederizados nativamente?"
          ),
        ],
      )
    );
  }
}