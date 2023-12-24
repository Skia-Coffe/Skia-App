import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:skia_coffee/core/resources/data_state.dart';
import 'package:skia_coffee/features/favorites/business/usecases/add_wishlist_usecase.dart';
import 'package:skia_coffee/features/favorites/business/usecases/get_wishlist.dart';
import 'package:skia_coffee/features/favorites/presentation/bloc/remote_wishlist_event.dart';
import 'package:skia_coffee/features/favorites/presentation/bloc/remote_wishlist_state.dart';

class RemoteWishlistBloc
    extends Bloc<RemoteWishlistEvent, RemoteWishlistState> {
  final GetWishlistUseCase _getWishlistUseCase;
  RemoteWishlistBloc(this._getWishlistUseCase)
      : super(const RemoteWishlistStateLoading()) {
    on<GetWishlistProducts>(onGetWishlistProducts);
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
}

class RemoteAddWishlistBloc
    extends Bloc<RemoteAddWishlistEvent, RemoteWishlistState> {
  final AddWishlistUseCase _addWishlistUseCase;
  RemoteAddWishlistBloc(this._addWishlistUseCase)
      : super(const RemoteWishlistStateLoading()) {
    on<AddWishlistProducts>(onAddWishlistProducts);
  }

  Logger logger = Logger();

  void onAddWishlistProducts(
      AddWishlistProducts products, Emitter<RemoteWishlistState> emit) async {
    await _addWishlistUseCase(params: products.addWishlistEntity);
  }
}
