import 'package:skia_coffee/features/quiz/business/entities/quiz_entity.dart';

class QuizModel extends QuizEntity {
  const QuizModel(
      {final String? question,
      final String? option1,
      final String? option2,
      final String? option3,
      final String? option4});

  factory QuizModel.fromJson(Map<String, dynamic> map) {
    return QuizModel(
      question: map['question'] ?? "Sample",
      option1: map['option1'] ?? "afa",
      option2: map['option2'] ?? "afa",
      option3: map['option3'] ?? "af",
      option4: map['option4'] ?? "af",
    );
  }
}
