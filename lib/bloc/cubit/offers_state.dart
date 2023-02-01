part of 'offers_cubit.dart';

class OffersState extends Equatable {
  OffersState(
    this.allOffers, {
    this.showInvalids = true,
    this.btcPrice = 0,
    this.dolarModal = 0,
    this.minVolume = 0,
    this.lastUpdate = 0,
  });
  OffersState.init() : this(null);

  final List? allOffers;
  bool showInvalids;
  double btcPrice;
  double dolarModal;
  double minVolume;
  int lastUpdate;

  OffersState copyWith({
    List? allOffers,
  }) {
    return OffersState(
      allOffers ?? this.allOffers,
    );
  }

  @override
  List<Object> get props => [allOffers ?? ''];
}
