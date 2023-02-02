import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gorilla_hash/bloc/cubit/offers_cubit.dart';
import 'package:gorilla_hash/components/p2p/item.dart';

class OffersList extends StatelessWidget {
  const OffersList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OffersCubit, OffersState>(
      builder: (context, state) {
        return SizedBox(
          child: Column(
            children: [
              for (Map offer in state.allOffers)
                (P2pOfferItem(
                  offer: offer['data'],
                  btcPrice: state.btcPrice,
                  dolarModal: state.dolarModal,
                  minVolume: state.minVolume,
                  showInvalids: state.showInvalids,
                )),
            ],
          ),
        );
      },
    );
  }
}
