import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gorilla_hash/services/index.dart';

part 'offers_state.dart';

class OffersCubit extends Cubit<OffersState> {
  OffersCubit() : super(OffersState.init());

  String getAllOffers() {
    return 'All Offers';
  }

  Future<void> getp2pOffers(context) async {
    try {
      emit(state.copyWith(loading: true));
      Dio dio = getDio();
      String _getOffersApi = dotenv.env['API_GET_OFFERS'].toString();

      Response response = await dio.get(_getOffersApi);

      List offerList = response.data?['data']?['ad_list'] ?? [];

      double minVolume =
          double.parse(response.data?['data']?['min_amount'] ?? '0');

      emit(state.copyWith(
          allOffers: offerList, minVolume: minVolume, loading: false));
    } catch (e) {
      if (e is DioError) {}
    }
  }

  getbtcPrice(context) async {
    try {
      emit(state.copyWith(loading: true));
      Dio dio = getDio();
      String _btcApi = dotenv.env['API_GET_BTC_PRICE'].toString();
      Response response = await dio.get(_btcApi);

      double btcPrice = double.parse(response.data['price']);

      emit(state.copyWith(btcPrice: (btcPrice), loading: false));
    } catch (e) {
      if (e is DioError) {}
    }
  }

  getDolarModal(context) async {
    try {
      emit(state.copyWith(loading: true));
      Dio dio = getDio();
      String _dolarModalApi = dotenv.env['API_GET_DOLAR_MODAL'].toString();
      Response response = await dio.get(_dolarModalApi);

      final dolarText = response.data['compra'].replaceAll(',', '.');
      double dolar = double.parse(dolarText);

      emit(state.copyWith(dolarModal: dolar, loading: false));
    } catch (e) {
      if (e is DioError) {}
    }
  }

  void toggleShowInvalids() {
    emit(state.copyWith(showInvalids: !state.showInvalids));
  }

  void setMinVolume(double value) {
    emit(state.copyWith(minVolume: value));
  }

  void setDolarModal(double value) {
    emit(state.copyWith(dolarModal: value));
  }
}
