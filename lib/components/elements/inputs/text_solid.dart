import 'package:flutter/material.dart';

class InputSolid extends StatefulWidget {
  String label;

  Function? validate;

  bool? obscure;

  Color? borderColor;

  dynamic controller;
  dynamic icon;
  dynamic iconSuffix;

  double? textSize;

  InputSolid({
    this.obscure,
    this.textSize,
    this.icon,
    this.controller,
    this.iconSuffix,
    this.borderColor,
    this.validate,
    required this.label,
  });

  @override
  _InputSolidState createState() => _InputSolidState();
}

class _InputSolidState extends State<InputSolid> {
  dynamic textStyle = const TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(5.0),
            topRight: Radius.circular(5.0),
          ),
        ),
        child: TextFormField(
          validator: (e) {
            if (widget.validate != null) {
              return widget.validate!(e);
            }
          },
          controller: widget.controller == null
              ? TextEditingController()
              : widget.controller,
          obscureText: widget.obscure == true ? true : false,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
              prefixIcon: widget.icon == null ? null : Image.asset(widget.icon),
              suffixIcon: widget.iconSuffix == null
                  ? null
                  : Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: widget.iconSuffix,
                    ),
              hintStyle: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w300,
                  fontSize: widget.textSize ?? 16),
              hintText: widget.label),
        ));
  }
}
