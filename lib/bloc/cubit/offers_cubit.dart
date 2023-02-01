import 'dart:developer';
import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:gorilla_hash/services/index.dart';
import 'package:meta/meta.dart';

part 'offers_state.dart';

class OffersCubit extends Cubit<OffersState> {
  OffersCubit() : super(OffersState.init());

  String getAllOffers() {
    return 'All Offers';
  }

  getp2pOffers(context) async {
    try {
      Dio dio = getDio();

      Response response = await dio
          .get('https://localbitcoins.com/sell-bitcoins-online/ars/.json');

      List offerList = response.data['data']['ad_list'];

      emit(state.copyWith(allOffers: offerList));
      return response.data['data']['ad_list'];
    } catch (e) {
      if (e is DioError) {
        log('e.response?.data');
      }
    }
  }

  getbtcPrice(context) async {
    try {
      Dio dio = getDio();

      Response response = await dio
          .get('https://api.binance.com/api/v1/ticker/price?symbol=BTCUSDC');

      double btcPrice = response.data['price'];

      emit(state.copyWith(btcPrice: btcPrice));
    } catch (e) {
      if (e is DioError) {}
    }
  }

  getDolarModal(context) async {
    try {
      Dio dio = getDio();

      Response response = await dio
          .get('https://mercados.ambito.com//dolar/informal/variacion');

      String dolar = response.data['compra'];
      emit(state.copyWith(dolarModal: dolar));
    } catch (e) {
      if (e is DioError) {}
    }
  }
}
