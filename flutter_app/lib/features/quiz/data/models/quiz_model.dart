import 'package:skia_coffee/features/quiz/business/entities/quiz_entity.dart';

class QuizModel extends QuizEntity {
  const QuizModel({
    final String? id,
    final String? question,
    final String? option1,
    final String? option2,
    final String? option3,
    final String? option4,
    final String? quizId,
  }) : super(
            id: id,
            question: question,
            option1: option1,
            option2: option2,
            option3: option3,
            option4: option4,
            quizId: quizId);

  factory QuizModel.fromJson(Map<String, dynamic> map) {
    return QuizModel(
      id: map['id'] ?? "1",
      question: map['question'] ?? "Sample",
      option1: map['option1'] ?? "afa",
      option2: map['option2'] ?? "afa",
      option3: map['option3'] ?? "af",
      option4: map['option4'] ?? "af",
      quizId: map['quizId'] ?? "2",
    );
  }
}
