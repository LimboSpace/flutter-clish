import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';

class NumberAnimation extends StatefulWidget {
  num number;
  String? suffix;
  TextStyle textStyle;
  NumberAnimation(
      {super.key, required this.textStyle, required this.number, this.suffix});

  @override
  State<NumberAnimation> createState() => _NumberAnimationState();
}

class _NumberAnimationState extends State<NumberAnimation> {
  @override
  Widget build(BuildContext context) {
    return AnimatedFlipCounter(
      duration: const Duration(milliseconds: 1000),
      value: widget.number as double,
      fractionDigits: 1,
      thousandSeparator: ',',
      decimalSeparator: '.',
      suffix: widget.suffix,
      textStyle: widget.textStyle,
    );
  }
}
