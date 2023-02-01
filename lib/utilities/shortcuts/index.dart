import 'package:flutter/material.dart';

double mediaWidth(double media, BuildContext context) {
  return MediaQuery.of(context).size.width * media;
}

double mediaHeight(double media, BuildContext context) {
  return MediaQuery.of(context).size.height * media;
}

String dollarCharacter() {
  return String.fromCharCodes(Runes('\u0024'));
}

ColorScheme gc(context) {
  return Theme.of(context).colorScheme;
}

Size mq(context) {
  return MediaQuery.of(context).size;
}
