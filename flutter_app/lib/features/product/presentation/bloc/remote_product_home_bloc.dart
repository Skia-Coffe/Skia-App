import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skia_coffee/core/resources/data_state.dart';
import 'package:skia_coffee/features/product/business/usecases/get_products.dart';
import 'package:skia_coffee/features/product/presentation/bloc/remote_product_home_event.dart';
import 'package:skia_coffee/features/product/presentation/bloc/remote_product_home_state.dart';

class RemoteProductsBloc
    extends Bloc<RemoteProductsEvent, RemoteProductsState> {
  final GetProductsUseCase _getProductUseCase;
  RemoteProductsBloc(this._getProductUseCase)
      : super(const RemoteProductsStateLoading()) {
    on<GetProducts>(onGetProducts);
  }

  void onGetProducts(
      GetProducts productHome, Emitter<RemoteProductsState> emit) async {
    final dataState = await _getProductUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteProductsStateDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      print(dataState.error!.message);
      emit(RemoteProductsStateError(dataState.error!));
    }
  }
}
