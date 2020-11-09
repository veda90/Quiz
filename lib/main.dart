import 'package:flutter/material.dart';
import 'package:quiz/pages/question_answer.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz',
      home: QuestionAnswer(),
    );
  }
}
