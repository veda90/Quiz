import 'package:flutter/foundation.dart';
import 'Option.dart';

class QuestionOption {
  final int id;
  final String question;
  final List<Option> options;

  QuestionOption({
    @required this.id,
    @required this.question,
    @required this.options,
  });
}
