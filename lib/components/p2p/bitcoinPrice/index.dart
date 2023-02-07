import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gorilla_hash/bloc/cubit/offers_cubit.dart';
import 'package:gorilla_hash/components/animations/number/index.dart';

class BitcoinPrice extends StatelessWidget {
  const BitcoinPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OffersCubit, OffersState>(
      builder: (context, state) {
        log(state.btcPrice.toString());
        return Container(
          margin: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FaIcon(FontAwesomeIcons.bitcoin, color: Colors.yellow),
              const SizedBox(
                width: 5,
              ),
              NumberAnimation(
                textStyle: const TextStyle(),
                number: state.btcPrice,
                suffix: ' USD',
              )
            ],
          ),
        );
      },
    );
  }
}
