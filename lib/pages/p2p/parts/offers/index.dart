import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gorilla_hash/bloc/cubit/offers_cubit.dart';
import 'package:gorilla_hash/components/p2p/item.dart';
import 'package:gorilla_hash/utilities/shortcuts/index.dart';

class OffersList extends StatelessWidget {
  const OffersList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OffersCubit, OffersState>(
      builder: (context, state) {
        return SizedBox(
          height: mq(context).height,
          child: ListView.builder(
            itemCount: state.filteredOffers.length,
            itemBuilder: (context, index) {
              return P2pOfferItem(
                offer: state.filteredOffers[index]['data'],
                btcPrice: state.btcPrice,
                dolarModal: state.dolarModal,
                minVolume: state.minVolume,
                showInvalids: state.showInvalids,
              );
            },
          ),
        );
      },
    );
  }
}
