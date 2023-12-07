import 'package:equatable/equatable.dart';

class QuizEntity extends Equatable {
  final String? id;
  final String? question;
  final String? option1;
  final String? option2;
  final String? option3;
  final String? option4;
  final String? quizId;

  const QuizEntity(
      {this.id,
      this.question,
      this.option1,
      this.option2,
      this.option3,
      this.option4,
      this.quizId});

  @override
  List<Object?> get props {
    return [id, question, option1, option2, option3, option4, quizId];
  }
}
