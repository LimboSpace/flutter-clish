// ignore_for_file: prefer_if_null_operators

import 'package:flutter/material.dart';

class ButtonSolid extends StatefulWidget {
  String text;
  dynamic onPressed;
  Color? color, colorText;
  bool? disableButton;
  double? fontSize, height, width;

  ButtonSolid({
    this.onPressed,
    this.color,
    this.fontSize,
    this.height,
    this.colorText,
    this.width,
    this.disableButton,
    required this.text,
  });

  @override
  _ButtonSolidState createState() => _ButtonSolidState();
}

class _ButtonSolidState extends State<ButtonSolid> {
  @override
  Widget build(BuildContext context) {
    dynamic textStyle = TextStyle(
        color: widget.colorText ?? Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: widget.fontSize ?? 18);

    return Container(
      height: widget.height ?? 50,
      width: widget.width ?? MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
          color: widget.disableButton == true
              ? const Color(0xff9F9FA6)
              : widget.color == null
                  ? Theme.of(context).colorScheme.primary
                  : widget.color,
          borderRadius: BorderRadius.circular(10)),
      child: TextButton(
          onPressed: () {
            widget.onPressed == null ? () {} : widget.onPressed!();
          },
          child: Text(
            widget.text,
            style: textStyle,
          )),
    );
  }
}
