import 'package:flutter/material.dart';

class Question {
  final String id;
  final String title;
  final List<String> options;

  Question({required this.id, required this.options, required this.title});

  @override
  String toString() {
    return 'Question(id: $id,title: $title,options: $options)';
  }
}

class QuizProvider extends ChangeNotifier {
  List<Question> _questions = [];

  List<Question> get questions => _questions;

  void addQuestion(Question q) {
    _questions.add(q);
    notifyListeners();
  }
}
