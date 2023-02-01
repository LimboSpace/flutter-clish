part of 'offers_cubit.dart';

class OffersState extends Equatable {
  const OffersState(this.allOffers);
  const OffersState.init() : this(null);
  final List? allOffers;

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
