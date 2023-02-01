import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gorilla_hash/bloc/cubit/offers_cubit.dart';
import 'package:gorilla_hash/components/p2p/item.dart';

class Offers extends StatefulWidget {
  const Offers({super.key});

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OffersCubit, OffersState>(
      builder: (context, state) {
        log('STATE: ${state.allOffers.toString()}');

        return Column(
          children: [
            for (dynamic i = 0; i < state.allOffers?.length; i++)
              (P2pOfferItem(
                offer: state.allOffers![i],
                btcPrice: state.btcPrice,
                dolarModal: state.dolarModal,
                minVolume: state.minVolume,
                showInvalids: state.showInvalids,
              )),
          ],
        );
      },
    );
  }
}
