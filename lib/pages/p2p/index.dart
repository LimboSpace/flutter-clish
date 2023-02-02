// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gorilla_hash/bloc/cubit/offers_cubit.dart';
import 'package:gorilla_hash/pages/p2p/parts/bitcoinPrice/index.dart';
import 'package:gorilla_hash/pages/p2p/parts/header/index.dart';
import 'package:gorilla_hash/pages/p2p/parts/headerTable/index.dart';
import 'package:gorilla_hash/pages/p2p/parts/offers/index.dart';
import 'package:gorilla_hash/utilities/formatter/numbers/index.dart';
import 'package:gorilla_hash/utilities/shortcuts/index.dart';

class p2pScreen extends StatefulWidget {
  Function? changeLoading;

  p2pScreen({super.key, this.changeLoading});

  @override
  State<p2pScreen> createState() => _p2pScreenState();
}

class _p2pScreenState extends State<p2pScreen> {
  TextEditingController dollarPriceController = TextEditingController();
  TextEditingController relevantVolumeController = TextEditingController();

  void dispatchp2pScreen() async {
    await BlocProvider.of<OffersCubit>(context).getp2pOffers(context);
  }

  @override
  void initState() {
    dispatchp2pScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Page(),
    );
  }

  Widget Page() {
    return BlocBuilder<OffersCubit, OffersState>(
      builder: (context, state) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Header(),
                const HeaderTable(),
                const BitcoinPrice(),
                const SizedBox(
                  height: 10,
                ),
                if (state.minVolume != 0)
                  (Column(
                    children: [
                      Row(
                        children: [
                          const Text('Volumen relevante mínimo: '),
                          Text(
                            formatNumber(state.minVolume),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Ocultar los inválidos:',
                              style: TextStyle(color: gc(context).primary)),
                          Switch(
                            value: state.showInvalids,
                            onChanged: (boool) {
                              setState(() {
                                state.showInvalids = !state.showInvalids;
                              });
                            },
                            activeTrackColor: Colors.black,
                            inactiveTrackColor: Colors.black,
                            activeColor: gc(context).primary,
                          ),
                        ],
                      )
                    ],
                  )),
                const OffersList(),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
