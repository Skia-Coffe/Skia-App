import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:skia_coffee/features/favorites/business/repositories/add_wishlist_repository.dart';
import 'package:skia_coffee/features/favorites/business/repositories/wishlist_repository.dart';
import 'package:skia_coffee/features/favorites/business/usecases/add_wishlist_usecase.dart';
import 'package:skia_coffee/features/favorites/business/usecases/get_wishlist.dart';
import 'package:skia_coffee/features/favorites/business/usecases/remove_wishlist_usecase.dart';
import 'package:skia_coffee/features/favorites/data/repositories/add_wishlist_repository_impl.dart';
import 'package:skia_coffee/features/favorites/data/repositories/wishlist_repository_impl.dart';
import 'package:skia_coffee/features/favorites/presentation/bloc/remote_wishlist_bloc.dart';
import 'package:skia_coffee/features/home/business/repositories/home_repositories.dart';
import 'package:skia_coffee/features/home/business/usecases/get_products_home.dart';
import 'package:skia_coffee/features/home/business/usecases/get_recommendations.dart';
import 'package:skia_coffee/features/home/data/repositories/home_repository_impl.dart';
import 'package:skia_coffee/features/home/presentation/bloc/products/remote_product_home_bloc.dart';
import 'package:skia_coffee/features/home/presentation/bloc/your_special_products_bloc/remote_recommendations_bloc.dart';
import 'package:skia_coffee/features/product/business/repositories/products_repositories.dart';
import 'package:skia_coffee/features/product/business/usecases/get_product_detials.dart';
import 'package:skia_coffee/features/product/business/usecases/get_products.dart';
import 'package:skia_coffee/features/product/data/repositories/product_repository_impl.dart';
import 'package:skia_coffee/features/product/presentation/bloc/product_details/remote_product_details_bloc.dart';
import 'package:skia_coffee/features/product/presentation/bloc/remote_product_home_bloc.dart';
import 'package:skia_coffee/features/quiz/business/repositories/quiz_answers_sending_repository.dart';
import 'package:skia_coffee/features/quiz/business/repositories/quiz_repository.dart';
import 'package:skia_coffee/features/quiz/business/usecases/get_quiz.dart';
import 'package:skia_coffee/features/quiz/business/usecases/send_answers.dart';
import 'package:skia_coffee/features/quiz/data/datasources/remote/quiz_api_service.dart';
import 'package:skia_coffee/features/quiz/data/repositories/quiz_answers_sending_repository_impl.dart';
import 'package:skia_coffee/features/quiz/data/repositories/quiz_repository_impl.dart';
import 'package:skia_coffee/features/quiz/presentation/bloc/remote/remote_quiz_bloc.dart';
import 'package:skia_coffee/features/recommedations/business/repositories/recommendation_repositories.dart';
import 'package:skia_coffee/features/recommedations/business/usecases/get_recommendations.dart';
import 'package:skia_coffee/features/recommedations/data/repositories/recommendation_repository_impl.dart';
import 'package:skia_coffee/features/recommedations/presentation/bloc/answer_sending/remote/remote_recommendations_bloc.dart';
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
  s1.registerSingleton<QuizAnswerSendingRepository>(
      QuizAnswerSendingRepositoryImpl());
  s1.registerSingleton<RecommendationRepository>(
      RecommendationRespositoryImp());
  s1.registerSingleton<HomeReprository>(HomeRepositoryImpl());
  s1.registerSingleton<ProductsRepository>(ProductsRepositoryImpl());
  s1.registerSingleton<WishlistRepository>(WishlistRepositoryImpl());
  s1.registerSingleton<AddWishlistRepository>(AddWishlistRepositoryImpl());

  //usecase
  s1.registerSingleton<GetQuizUseCase>(GetQuizUseCase(s1()));
  s1.registerSingleton<SendAnswersUseCase>(SendAnswersUseCase(s1()));
  s1.registerSingleton<GetRecommendationsUseCase>(
      GetRecommendationsUseCase(s1()));
  s1.registerSingleton<GetProductHomeUseCase>(GetProductHomeUseCase(s1()));
  s1.registerSingleton<GetProductsUseCase>(GetProductsUseCase(s1()));
  s1.registerSingleton<GetRecommendationsHomeUseCase>(
      GetRecommendationsHomeUseCase(s1()));
  s1.registerSingleton<GetProductDetialsUseCase>(
      GetProductDetialsUseCase(s1()));
  s1.registerSingleton<GetWishlistUseCase>(GetWishlistUseCase(s1()));
  s1.registerSingleton<AddWishlistUseCase>(AddWishlistUseCase(s1()));
  s1.registerSingleton<RemoveWishlistUseCase>(RemoveWishlistUseCase(s1()));

  //Blocs
  s1.registerFactory<RemoteQuizBloc>(() => RemoteQuizBloc(s1()));
  s1.registerFactory<RemoteAnswerSendingBloc>(
      () => RemoteAnswerSendingBloc(s1()));
  s1.registerFactory<RemoteRecommendationBloc>(
      () => RemoteRecommendationBloc(s1()));
  s1.registerFactory<RemoteProductHomeBloc>(() => RemoteProductHomeBloc(s1()));
  s1.registerFactory<RemoteProductsBloc>(() => RemoteProductsBloc(s1()));
  s1.registerFactory<RemoteRecommendationHomeBloc>(
      () => RemoteRecommendationHomeBloc(s1()));
  s1.registerFactory<RemoteProductDetailsBloc>(
      () => RemoteProductDetailsBloc(s1()));
  s1.registerFactory<RemoteWishlistBloc>(
      () => RemoteWishlistBloc(s1(), s1(), s1()));
}
