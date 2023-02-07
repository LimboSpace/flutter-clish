// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gorilla_hash/bloc/cubit/offers_cubit.dart';
import 'package:gorilla_hash/components/elements/loading/screen_spinner.dart';
import 'package:gorilla_hash/components/p2p/bitcoinPrice/index.dart';
import 'package:gorilla_hash/components/p2p/header/index.dart';
import 'package:gorilla_hash/components/p2p/headerTable/index.dart';
import 'package:gorilla_hash/components/p2p/offers/index.dart';
import 'package:gorilla_hash/utilities/formatter/numbers/index.dart';
import 'package:gorilla_hash/utilities/shortcuts/index.dart';
import 'package:gorilla_hash/utilities/storage/index.dart';

class binanceOffersScreen extends StatefulWidget {
  Function? changeLoading;

  binanceOffersScreen({super.key, this.changeLoading});

  @override
  State<binanceOffersScreen> createState() => _p2pScreenState();
}

class _p2pScreenState extends State<binanceOffersScreen> {
  TextEditingController dollarPriceController = TextEditingController();
  TextEditingController relevantVolumeController = TextEditingController();

  @override
  void initState() {
    dispatchp2pScreen();

    super.initState();
  }

  void dispatchp2pScreen() async {
    BlocProvider.of<OffersCubit>(context).setLoading(true);
    Timer.periodic(const Duration(seconds: 5), (e) async {
      await BlocProvider.of<OffersCubit>(context).getBinanceOffers(context);
      await BlocProvider.of<OffersCubit>(context).getbtcPrice(context);
    });
    await BlocProvider.of<OffersCubit>(context).getDolarModal(context);

    dynamic dollarModalRes = await readST('dollarmodal', 'double');
    if (dollarModalRes != null && dollarModalRes != '') {
      BlocProvider.of<OffersCubit>(context).setDolarModal(dollarModalRes);
      dollarPriceController.text = dollarModalRes.toString();
    }

    BlocProvider.of<OffersCubit>(context).setLoading(false);
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
        if (state.loading) {
          return Center(
            child: ScreenSpinner(),
          );
        } else {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Header(
                    state: state,
                    dollarPriceController: dollarPriceController,
                    relevantVolumeController: relevantVolumeController,
                  ),
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
                                BlocProvider.of<OffersCubit>(context)
                                    .toggleShowInvalids();
                              },
                              activeTrackColor: Colors.black,
                              inactiveTrackColor: Colors.black,
                              activeColor: gc(context).primary,
                            ),
                          ],
                        )
                      ],
                    )),
                  const OffersList(
                    isBinance: true,
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
