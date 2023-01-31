import 'dart:async';

import 'package:flutter/material.dart';

class FadeAnimation extends StatefulWidget {
  Widget child;
  FadeAnimation({super.key, required this.child});

  @override
  State<FadeAnimation> createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();

    if (mounted) {
      Timer(const Duration(milliseconds: 600), () {
        setState(() {
          _visible = true;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _visible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 700),
      child: widget.child,
    );
  }
}
