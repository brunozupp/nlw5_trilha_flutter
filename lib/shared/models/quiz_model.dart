
import 'dart:convert';

import 'package:nlw5_trilha_flutter/shared/models/question_model.dart';

enum Level {
  facil, medio, dificil, perito
}

extension LevelStringExtension on String {

  Level fromMap() => {
    "facil" : Level.facil,
    "medio" : Level.medio,
    "dificil" : Level.dificil,
    "perito" : Level.perito
  }[this]!;
}

extension LevelExtension on Level {

  String toMap() => {
    Level.facil : "facil",
    Level.medio : "medio",
    Level.dificil : "dificil",
    Level.perito : "perito"
  }[this]!;
}

class QuizModel {

  final String title;
  final List<QuestionModel> questions;
  final int questionAnswered;
  final String image;
  final Level level;

  QuizModel({
    required this.title, 
    required this.questions,
    this.questionAnswered = 0,
    required this.image,
    required this.level
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questions.map((x) => x.toMap()).toList(),
      'questionAnswered': questionAnswered,
      'image': image,
      'level': level.toMap(),
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      title: map['title'],
      questions: List<QuestionModel>.from(map['questions']?.map((x) => QuestionModel.fromMap(x))),
      questionAnswered: map['questionAnswered'],
      image: map['image'],
      level: map['level'].toString().fromMap(),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) => QuizModel.fromMap(json.decode(source));
}
