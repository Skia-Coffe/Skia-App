import 'package:skia_coffee/features/quiz/business/entities/request_entity.dart';

class RequestModel extends RequestEntity {
  RequestModel({
    String? flavour,
    String? roast,
    String? brewMethod,
    String? strong,
    String? additionalFlavour,
    String? UserID,
  }) : super(
            UserID: UserID,
            flavour: flavour,
            roast: roast,
            brewMethod: brewMethod,
            strong: strong,
            additionalFlavour: additionalFlavour);

  Map<String, dynamic> toJson() {
    return {
      'UserID': UserID,
      'flavour': flavour,
      'roast': roast,
      'brew_method': brewMethod,
      'strong': strong,
      'additional_flavour': additionalFlavour,
    };
  }
}
