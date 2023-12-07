import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:skia_coffee/auth/signUp/repository/authentication_repository.dart';
import 'package:skia_coffee/features/quiz/business/repositories/quiz_repository.dart';
import 'package:skia_coffee/features/quiz/business/usecases/get_quiz.dart';
import 'package:skia_coffee/features/quiz/data/datasources/remote/quiz_api_service.dart';
import 'package:skia_coffee/features/quiz/data/repositories/quiz_repository_impl.dart';
import 'package:skia_coffee/features/quiz/presentation/bloc/remote/remote_quiz_bloc.dart';
import 'package:skia_coffee/features/recommedations/business/repositories/recommendation_repositories.dart';
import 'package:skia_coffee/features/recommedations/business/usecases/get_recommendations.dart';
import 'package:skia_coffee/features/recommedations/data/repositories/recommendation_repository_impl.dart';
import 'package:skia_coffee/features/recommedations/presentation/bloc/remote/remote_recommendations_bloc.dart';

final s1 = GetIt.instance;
Future<void> initializeDependencies() async {
  //Dependencies

  //Dio
  s1.registerSingleton<Dio>(Dio());

  //QuizApiService
  s1.registerSingleton<QuizApiService>(QuizApiService(s1()));

  //repository
  s1.registerSingleton<QuizReprository>(QuizRepositoryImpl(s1()));
  s1.registerSingleton<RecommendationRepository>(
      RecommendationRespositoryImp());

  //usecase
  s1.registerSingleton<GetQuizUseCase>(GetQuizUseCase(s1()));
  s1.registerSingleton<GetRecommendationsUseCase>(
      GetRecommendationsUseCase(s1()));

  //Blocs
  s1.registerFactory<RemoteQuizBloc>(() => RemoteQuizBloc(s1()));
  s1.registerFactory<RemoteRecommendationBloc>(
      () => RemoteRecommendationBloc(s1()));
}
