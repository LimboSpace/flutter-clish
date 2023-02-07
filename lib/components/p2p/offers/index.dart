import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gorilla_hash/bloc/cubit/offers_cubit.dart';
import 'package:gorilla_hash/components/p2p/item.dart';
import 'package:gorilla_hash/components/p2p/p2pBinance/item.dart';
import 'package:gorilla_hash/utilities/shortcuts/index.dart';

class OffersList extends StatelessWidget {
  final bool isBinance;
  const OffersList({super.key, this.isBinance = false});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OffersCubit, OffersState>(
      builder: (context, state) {
        if (isBinance) {
          return SizedBox(
            height: mq(context).height,
            child: ListView.builder(
              itemCount: state.binanceOffers.length,
              itemBuilder: (context, index) {
                return BinanceP2pOfferItem(
                  offer: state.binanceOffers[index]['adv'],
                  btcPrice: state.btcPrice,
                  dolarModal: state.dolarModal,
                  minVolume: state.minVolume,
                  showInvalids: state.showInvalids,
                );
              },
            ),
          );
        }
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
