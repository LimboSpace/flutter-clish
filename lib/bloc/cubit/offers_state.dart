part of 'offers_cubit.dart';

class OffersState extends Equatable {
  OffersState(
    this.allOffers, {
    this.filteredOffers = const [],
    this.binanceOffers = const [],
    this.filteredBinanceOffers = const [],
    this.showInvalids = true,
    this.loading = false,
    this.btcPrice = 0,
    this.dolarModal = 0,
    this.minVolume = 0,
    this.lastUpdate = 0,
  });
  OffersState.init() : this([]);

  List allOffers;
  List filteredOffers;
  List binanceOffers;
  List filteredBinanceOffers;
  bool showInvalids;
  bool loading;
  double btcPrice;
  double dolarModal;
  double minVolume;
  int lastUpdate;

  OffersState copyWith({
    List? allOffers,
    List? filteredOffers,
    List? binanceOffers,
    List? filteredBinanceOffers,
    bool? showInvalids,
    bool? loading,
    double? btcPrice,
    double? minVolume,
    int? lastUpdate,
    double? dolarModal,
  }) {
    return OffersState(
      allOffers ?? this.allOffers,
      filteredOffers: filteredOffers ?? this.filteredOffers,
      binanceOffers: binanceOffers ?? this.binanceOffers,
      filteredBinanceOffers:
          filteredBinanceOffers ?? this.filteredBinanceOffers,
      showInvalids: showInvalids ?? this.showInvalids,
      loading: loading ?? this.loading,
      btcPrice: btcPrice ?? this.btcPrice,
      dolarModal: dolarModal ?? this.dolarModal,
      minVolume: minVolume ?? this.minVolume,
      lastUpdate: lastUpdate ?? this.lastUpdate,
    );
  }

  @override
  List<Object> get props => [
        allOffers,
        filteredOffers,
        filteredBinanceOffers,
        binanceOffers,
        showInvalids,
        loading,
        btcPrice,
        minVolume,
        lastUpdate,
        dolarModal
      ];
}
