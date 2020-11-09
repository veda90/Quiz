import 'package:flutter/foundation.dart';
import '../Model/Option.dart';
import '../Model/QuestionOption.dart';

class QuizManager {
  QuestionOption fetchInitialQuestion() {
    List<Option> optionsList = [
      Option(title: 'Pratap Sarangi', isValid: null, isSelected: false),
      Option(title: 'Aparajita Sarangi', isValid: null, isSelected: false),
      Option(title: 'Sura Routray', isValid: null, isSelected: false),
      Option(title: 'Dharmendra Pradhan', isValid: null, isSelected: false),
      Option(title: 'Naveen Patnaik', isValid: null, isSelected: false)
    ];

    QuestionOption currentQuestion = QuestionOption(
      id: 1,
      question: 'Who should be the next Cheif Minister of Odisha ?',
      options: optionsList,
    );
    return currentQuestion;
  }

  QuestionOption fetchAnswer(int index) {
    List<Option> optionsListValidated = [
      Option(title: 'Pratap Sarangi', isValid: false, isSelected: false),
      Option(title: 'Aparajita Sarangi', isValid: true, isSelected: false),
      Option(title: 'Sura Routray', isValid: false, isSelected: false),
      Option(title: 'Dharmendra Pradhan', isValid: false, isSelected: false),
      Option(title: 'Naveen Patnaik', isValid: false, isSelected: false)
    ];

    optionsListValidated[index].isSelected = true;

    QuestionOption answer = QuestionOption(
      id: 1,
      question: 'Who should be the next Cheif Minister of Odisha ?',
      options: optionsListValidated,
    );
    return answer;
  }

  QuestionOption fetchNextQuestion() {
    List<Option> optionsList = [
      Option(title: 'Udra', isValid: null, isSelected: false),
      Option(title: 'Kalinga', isValid: null, isSelected: false),
      Option(title: 'Mahesmati', isValid: null, isSelected: false),
      Option(title: 'Utkal', isValid: null, isSelected: false),
    ];

    QuestionOption question = QuestionOption(
      id: 2,
      question: 'Which of these names is not related to Odisha ?',
      options: optionsList,
    );
    return question;
  }
}
