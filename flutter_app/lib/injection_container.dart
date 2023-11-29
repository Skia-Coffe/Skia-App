import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:skia_coffee/features/quiz/business/repositories/quiz_repository.dart';
import 'package:skia_coffee/features/quiz/business/usecases/get_quiz.dart';
import 'package:skia_coffee/features/quiz/data/datasources/remote/quiz_api_service.dart';
import 'package:skia_coffee/features/quiz/data/repositories/quiz_repository_impl.dart';
import 'package:skia_coffee/features/quiz/presentation/bloc/remote/remote_quiz_bloc.dart';

final s1 = GetIt.instance;
Future<void> initializeDependencies() async {
  //Dependencies

  //Dio
  s1.registerSingleton<Dio>(Dio());

  //QuizApiService
  s1.registerSingleton<QuizApiService>(QuizApiService(s1()));

  s1.registerSingleton<QuizReprository>(QuizRepositoryImpl(s1()));

  //usecase
  s1.registerSingleton<GetQuizUseCase>(GetQuizUseCase(s1()));

  //Blocs
  s1.registerFactory<RemoteQuizBloc>(() => RemoteQuizBloc(s1()));
}
