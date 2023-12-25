import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:skia_coffee/core/resources/data_state.dart';
import 'package:skia_coffee/features/favorites/business/usecases/add_wishlist_usecase.dart';
import 'package:skia_coffee/features/favorites/business/usecases/get_wishlist.dart';
import 'package:skia_coffee/features/favorites/business/usecases/remove_wishlist_usecase.dart';
import 'package:skia_coffee/features/favorites/presentation/bloc/remote_wishlist_event.dart';
import 'package:skia_coffee/features/favorites/presentation/bloc/remote_wishlist_state.dart';

class RemoteWishlistBloc
    extends Bloc<RemoteWishlistEvent, RemoteWishlistState> {
  final GetWishlistUseCase _getWishlistUseCase;
  final AddWishlistUseCase _addWishlistUseCase;
  final RemoveWishlistUseCase _removeWishlistUseCase;
  RemoteWishlistBloc(this._getWishlistUseCase, this._addWishlistUseCase,
      this._removeWishlistUseCase)
      : super(const RemoteWishlistStateLoading()) {
    on<GetWishlistProducts>(onGetWishlistProducts);
    on<AddWishlistProducts>(onAddWishlistProducts);
    on<RemoveWishlisProducts>(onRemoveWishlistProducts);
  }

  Logger logger = Logger();

  void onGetWishlistProducts(
      GetWishlistProducts products, Emitter<RemoteWishlistState> emit) async {
    final dataState = await _getWishlistUseCase(params: products.userID);
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteWishlistStateDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      logger.i(dataState.error);
      emit(RemoteWishlistStateFailed(dataState.error!));
    }
  }

  void onAddWishlistProducts(
      AddWishlistProducts products, Emitter<RemoteWishlistState> emit) async {
    await _addWishlistUseCase(params: products.prod);
    final dataState = await _getWishlistUseCase(params: products.userID);
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteWishlistStateDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      logger.i(dataState.error);
      emit(RemoteWishlistStateFailed(dataState.error!));
    }
  }

  void onRemoveWishlistProducts(
      RemoveWishlisProducts products, Emitter<RemoteWishlistState> emit) async {
    Map<String, dynamic> myMap = Map();
    myMap['userID'] = products.userID;
    myMap['name'] = products.prod!.prod;
    await _removeWishlistUseCase(params: myMap);
    final dataState = await _getWishlistUseCase(params: products.userID);
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteWishlistStateDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      logger.i(dataState.error);
      emit(RemoteWishlistStateFailed(dataState.error!));
    }
  }
}
