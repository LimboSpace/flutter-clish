// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gorilla_hash/components/animations/number/index.dart';
import 'package:gorilla_hash/components/elements/statusOnline/container/index.dart';
import 'package:gorilla_hash/components/p2p/item.dart';
import 'package:gorilla_hash/utilities/formatter/numbers/index.dart';
import 'package:gorilla_hash/utilities/shortcuts/index.dart';
import 'package:gorilla_hash/utilities/styles/styles.dart';

class p2pScreen extends StatefulWidget {
  Function? changeLoading;

  p2pScreen({super.key, this.changeLoading});

  @override
  State<p2pScreen> createState() => _p2pScreenState();
}

class _p2pScreenState extends State<p2pScreen> {
  bool showInvalids = true;

  double btcPrice = 0;
  double dolarModal = 200;
  double minVolume = 0;

  int lastUpdate = 0;

  List offers = [];

  TextEditingController dollarPriceController = TextEditingController();
  TextEditingController relevantVolumeController = TextEditingController();

/* openModalSetDollar() {
    openDialog(
        context,
        ModalSetDollar(
            onSubmit: filterOffers,
            dollarPriceController: dollarPriceController,
            relevantVolumeController: relevantVolumeController));
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Page(),
    );
  }

  Widget Page() {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
        child: Column(
          children: [
            Header(),
            HeaderTable(),
            BitcoinPrice(),
            const SizedBox(
              height: 10,
            ),
            if (minVolume != 0)
              (Column(
                children: [
                  Row(
                    children: [
                      const Text('Volumen relevante mínimo: '),
                      Text(
                        formatNumber(minVolume),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Ocultar los inválidos:',
                          style: TextStyle(color: gc(context).primary)),
                      Switch(
                        value: showInvalids,
                        onChanged: (boool) {
                          setState(() {
                            showInvalids = !showInvalids;
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
            Column(
              children: [
                for (dynamic i = 0; i < offers.length; i++)
                  (P2pOfferItem(
                    offer: offers[i],
                    btcPrice: btcPrice,
                    dolarModal: dolarModal,
                    minVolume: minVolume,
                    showInvalids: showInvalids,
                  )),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }

  Container BitcoinPrice() {
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
            number: btcPrice,
            suffix: ' USD',
          )
        ],
      ),
    );
  }

  Container HeaderTable() {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xffFFF8E7)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Center(
                  child: Text(
                'Cambio',
                style: TextStyle(
                    color: gc(context).surface, fontWeight: FontWeight.bold),
              )),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              decoration: BoxDecoration(color: gc(context).surface),
              child: const Center(
                  child: Text(
                'Min - Max',
                style: TextStyle(
                    color: Color(0xffFFF8E7), fontWeight: FontWeight.bold),
              )),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Center(
                  child: Text(
                '%',
                style: TextStyle(
                    color: gc(context).surface, fontWeight: FontWeight.bold),
              )),
            ),
          ),
        ],
      ),
    );
  }

  Widget Header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              'assets/icons/transactions.svg',
              color: gc(context).primary,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Clishcoin',
              style: titlePageStyle,
            )
          ],
        ),
        Row(
          children: [
            const StatusOnlineContainer(),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(0, 1),
                  ),
                ], color: Colors.white, borderRadius: BorderRadius.circular(5)),
                padding: const EdgeInsets.all(6),
                child: SvgPicture.asset('assets/icons/config.svg'),
              ),
            ),
          ],
        )
      ],
    );
  }
}
