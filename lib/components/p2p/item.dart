// ignore_for_file: non_constant_identifier_names

import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:gorilla_hash/components/animations/fade/index.dart';
import 'package:gorilla_hash/components/animations/number/index.dart';
import 'package:gorilla_hash/components/elements/statusOnline/index.dart';
import 'package:gorilla_hash/utilities/colors/index.dart';
import 'package:gorilla_hash/utilities/copy/index.dart';
import 'package:gorilla_hash/utilities/formatter/numbers/index.dart';
import 'package:gorilla_hash/utilities/math/index.dart';
import 'package:gorilla_hash/utilities/shortcuts/index.dart';

class P2pOfferItem extends StatefulWidget {
  Map offer;
  double btcPrice;
  double dolarModal;
  bool? showInvalids;
  double? minVolume;
  P2pOfferItem(
      {this.minVolume,
      this.showInvalids,
      required this.offer,
      required this.btcPrice,
      required this.dolarModal});

  @override
  State<P2pOfferItem> createState() => _P2pOfferItemState();
}

class _P2pOfferItemState extends State<P2pOfferItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map offer = widget.offer;

    bool volumeIsAllowed = widget.minVolume != null &&
        double.parse(offer['max']) > widget.minVolume!;
    if (volumeIsAllowed) {
      return Content(volumeIsAllowed);
    } else if (volumeIsAllowed == false && widget.showInvalids == false) {
      return Content(volumeIsAllowed);
    } else {
      return Container();
    }
  }

  Widget Content(volumeIsAllowed) {
    Map offer = widget.offer;

    bool isVip =
        offer['username'].toString().toLowerCase().contains('anproweb');

    double ganancie = calculateGananceP2P(
        btcArs: double.parse(offer['price']),
        btcUsd: widget.btcPrice,
        dolarModal: widget.dolarModal);

    double price = calculatePriceOffer(
      btcArs: double.parse(offer['price']),
      btcUsd: widget.btcPrice,
    );
    double heightDouble = offer['banks'] != null && offer['banks'].length > 25
        ? mediaHeight(0.08, context)
        : mediaHeight(0.06, context);

    copyLink() {
      copy(formatNumber(offer['price']), context,
          text: '${formatNumber(offer['price'])} copiado!');
    }

    return GestureDetector(
      onTap: copyLink,
      child: FadeAnimation(
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              border: isVip
                  ? Border.all(color: gc(context).primary, width: 3)
                  : null,
              color: const Color(0xffF9FAFD),
              borderRadius: BorderRadius.circular(10)),
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 10, left: 10, right: 10),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: GestureDetector(
                              onTap: () {},
                              child: Stack(
                                children: [
                                  SizedBox(
                                    height: heightDouble,
                                    width: mediaHeight(0.3, context),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        NumberAnimation(
                                            suffix: dollarCharacter(),
                                            textStyle: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                            number: price),
                                        Text(
                                          offer['username'],
                                          style: const TextStyle(
                                              fontSize: 8,
                                              color: Color(0xff1A5FFF)),
                                        ),
                                        Text(
                                          '(${offer['trade_count']}; ${offer['feedback_score']}%)',
                                          style: const TextStyle(
                                              fontSize: 6,
                                              color: Color(0xff1A5FFF),
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    child: StatusOnline(
                                      radius: 4,
                                      lastOnline:
                                          DateTime.parse(offer['last_online']),
                                    ),
                                  )
                                ],
                              ),
                            )),
                        Separator(context),
                        Expanded(
                            flex: 6,
                            child: Container(
                              width: mediaHeight(0.4, context),
                              height: heightDouble,
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${formatNumberNoDecimals(offer['min'])} - ${formatNumberNoDecimals(offer['max'])}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Flexible(
                                    child: Text(offer['banks'],
                                        style: TextStyle(
                                            color: greyText, fontSize: 10),
                                        textAlign: TextAlign.center),
                                  ),
                                ],
                              ),
                            )),
                        Separator(context),
                        Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                NumberAnimation(
                                    suffix: '%',
                                    number: ganancie,
                                    textStyle: TextStyle(
                                        color: greenLight,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                  'Ganancia',
                                  style: TextStyle(
                                      color: greenLight, fontSize: 10),
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              if (volumeIsAllowed == false)
                (Positioned(
                    child: ClipRect(
                        child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                  child: SizedBox(
                    height: heightDouble + 20,
                    width: mediaHeight(0.04, context),
                  ),
                ))))
            ],
          ),
        ),
      ),
    );
  }

  Container Separator(BuildContext context) {
    return Container(
      color: const Color(0xffD9DCF4),
      height: mediaHeight(0.05, context),
      width: 1.5,
    );
  }
}
