import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gorilla_hash/models/localBitcoins/index.dart';
import 'package:gorilla_hash/services/index.dart';

part 'offers_state.dart';

class OffersCubit extends Cubit<OffersState> {
  OffersCubit() : super(OffersState.init());

  Future<void> getp2pOffers(context) async {
    try {
      Dio dio = getDio();
      String _getOffersApi = dotenv.env['API_GET_OFFERS'].toString();

      Response response = await dio.get(_getOffersApi);

      Map<String, dynamic> offerList = response.data ?? {};

      LocalBitcoins modelOffers = LocalBitcoins?.fromJson(offerList);

      emit(state.copyWith(
        allOffers: offerList['data']['ad_list'],
        filteredOffers: offerList['data']['ad_list'],
      ));
    } catch (e, track) {
      log(e.toString());
      log(track.toString());
      if (e is DioError) {}
    }
  }

  Future<void> getBinanceOffers(context) async {
    try {
      Dio dio = getDio();
      String _getBinanceOffers =
          dotenv.env['API_GET_BINANCE_OFFERS'].toString();

      final body = {
        "asset": "USDT",
        "fiat": "ARS",
        "currency": "ARS",
        "merchantCheck": true,
        "page": 1,
        "payTypes": ["BANK"],
        "publisherType": null,
        "rows": 20,
        "tradeType": "SELL"
      };

      Response response = await dio.post(_getBinanceOffers, data: body);

      List offerList = response.data['data'] ?? [];

      emit(state.copyWith(
        binanceOffers: offerList,
      ));
    } catch (e, track) {
      log(e.toString());
      log(track.toString());
      if (e is DioError) {}
    }
  }

  getbtcPrice(context) async {
    try {
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
      Dio dio = getDio();
      String _dolarModalApi = dotenv.env['API_GET_DOLAR_MODAL'].toString();
      Response response = await dio.get(_dolarModalApi);

      final dolarText = response.data['compra'].replaceAll(',', '.');
      double dolar = double.parse(dolarText);

      emit(state.copyWith(
        dolarModal: dolar,
      ));
    } catch (e) {
      if (e is DioError) {}
    }
  }

  void resetAllOffers() {
    emit(state.copyWith(allOffers: [], filteredOffers: []));
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

  void setFilteredOffers(List value) {
    emit(state.copyWith(filteredOffers: value));
  }

  void setLoading(bool value) {
    emit(state.copyWith(loading: value));
  }
}
