import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gorilla_hash/bloc/cubit/offers_cubit.dart';
import 'package:gorilla_hash/components/animations/number/index.dart';
import 'package:gorilla_hash/utilities/shortcuts/index.dart';

class BitcoinPrice extends StatefulWidget {
  const BitcoinPrice({super.key});

  @override
  State<BitcoinPrice> createState() => _BitcoinPriceState();
}

class _BitcoinPriceState extends State<BitcoinPrice> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OffersCubit, OffersState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(FontAwesomeIcons.bitcoin, color: gc(context).surface),
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
