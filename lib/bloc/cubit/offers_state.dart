part of 'offers_cubit.dart';

class OffersState extends Equatable {
  OffersState(
    this.allOffers, {
    this.showInvalids = true,
    this.btcPrice = 0,
    this.dolarModal = '',
    this.minVolume = 0,
    this.lastUpdate = 0,
  });
  OffersState.init() : this(null);

  List? allOffers;
  bool showInvalids;
  double btcPrice;
  String dolarModal;
  double minVolume;
  int lastUpdate;

  OffersState copyWith({
    List? allOffers,
    bool? showInvalids,
    double? btcPrice,
    double? minVolume,
    int? lastUpdate,
    String? dolarModal,
  }) {
    return OffersState(
      allOffers ?? this.allOffers,
      showInvalids: showInvalids ?? this.showInvalids,
      btcPrice: btcPrice ?? this.btcPrice,
      dolarModal: dolarModal ?? this.dolarModal,
      minVolume: minVolume ?? this.minVolume,
      lastUpdate: lastUpdate ?? this.lastUpdate,
    );
  }

  @override
  List<Object> get props => [allOffers ?? ''];
}
