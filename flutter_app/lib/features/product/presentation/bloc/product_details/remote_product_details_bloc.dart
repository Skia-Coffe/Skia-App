import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skia_coffee/core/resources/data_state.dart';
import 'package:skia_coffee/features/product/business/usecases/get_product_detials.dart';
import 'package:skia_coffee/features/product/presentation/bloc/product_details/remote_product_details_event.dart';
import 'package:skia_coffee/features/product/presentation/bloc/product_details/remote_product_details_state.dart';

class RemoteProductDetailsBloc
    extends Bloc<RemoteProductDetailsEvent, RemoteProductDetailsState> {
  final GetProductDetialsUseCase _getProducDetailsUseCase;
  RemoteProductDetailsBloc(this._getProducDetailsUseCase)
      : super(const RemoteProductDetailsStateLoading()) {
    on<GetProductDetails>(onGetProductDetails);
  }

  void onGetProductDetails(GetProductDetails productDetails,
      Emitter<RemoteProductDetailsState> emit) async {
    final dataState =
        await _getProducDetailsUseCase(params: productDetails.prodId);

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteProductDetailsStateDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      // print(dataState.error!.message);
      emit(RemoteProductDetailsStateError(dataState.error!));
    }
  }
}
