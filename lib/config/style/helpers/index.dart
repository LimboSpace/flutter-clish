import 'dart:ui';

import 'package:flutter/material.dart';

Widget blurBackground(Widget child) {
  return ClipRRect(
      child: BackdropFilter(
    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
    child: child,
  ));
}
