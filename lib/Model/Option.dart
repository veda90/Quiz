import 'package:flutter/foundation.dart';

class Option {
  final String title;
  bool isValid;
  bool isSelected;

  Option({
    @required this.title,
    @required this.isValid,
    @required this.isSelected,
  });
}
