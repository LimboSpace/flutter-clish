import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:gorilla_hash/utilities/colors/index.dart';
import 'package:gorilla_hash/utilities/shortcuts/index.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ScreenSpinner extends StatefulWidget {
  String? label = '';

  ScreenSpinner({this.label});

  @override
  _ScreenSpinnerState createState() => _ScreenSpinnerState();
}

class _ScreenSpinnerState extends State<ScreenSpinner>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.label != null && widget.label!.isNotEmpty)
                (Column(
                  children: [
                    Text(widget.label!,
                        style: const TextStyle(
                            color: darkBlue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 45,
                    )
                  ],
                )),
              LoadingAnimationWidget.discreteCircle(
                  color: Colors.white,
                  size: 50,
                  secondRingColor: gc(context).primary,
                  thirdRingColor: gc(context).secondary),
            ],
          ),
        ),
      ),
    );
  }
}
