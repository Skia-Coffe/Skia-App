import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skia_coffee/core/resources/data_state.dart';
import 'package:skia_coffee/features/home/business/usecases/get_products_home.dart';
import 'package:skia_coffee/features/home/presentation/bloc/products/remote_product_home_event.dart';
import 'package:skia_coffee/features/home/presentation/bloc/products/remote_product_home_state.dart';

class RemoteProductHomeBloc
    extends Bloc<RemoteProductHomeEvent, RemoteProductHomeState> {
  final GetProductHomeUseCase _getProductUseCase;
  RemoteProductHomeBloc(this._getProductUseCase)
      : super(const RemoteProductHomeStateLoading()) {
    on<GetProductsHome>(onGetProductsHome);
  }

  void onGetProductsHome(
      GetProductsHome productHome, Emitter<RemoteProductHomeState> emit) async {
    final dataState = await _getProductUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteProductHomeStateDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      print(dataState.error!.message);
      emit(RemoteProductHomeStateError(dataState.error!));
    }
  }
}
