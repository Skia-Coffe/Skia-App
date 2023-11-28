import 'package:equatable/equatable.dart';

class QuizEntity extends Equatable {
  final String? question;
  final String? option1;
  final String? option2;
  final String? option3;
  final String? option4;

  const QuizEntity(
      {this.question, this.option1, this.option2, this.option3, this.option4});

  @override
  List<Object?> get props {
    return [question, option1, option2, option3, option4];
  }
}
