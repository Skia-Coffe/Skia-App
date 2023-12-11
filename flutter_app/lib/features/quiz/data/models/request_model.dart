import 'package:skia_coffee/features/quiz/business/entities/request_entity.dart';

class RequestModel extends RequestEntity {
  RequestModel({
    String? flavour,
    String? roast,
    String? brewMethod,
    bool? strong,
    String? additionalFlavour,
  }) : super(
            flavour: flavour,
            roast: roast,
            brewMethod: brewMethod,
            strong: strong,
            additionalFlavour: additionalFlavour);

  Map<String, dynamic> toJson() {
    return {
      'flavour': flavour,
      'roast': roast,
      'brew_method': brewMethod,
      'strong': strong,
      'additional_flavour': additionalFlavour,
    };
  }
}
