import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gorilla_hash/utilities/colors/index.dart';
import 'package:gorilla_hash/utilities/shortcuts/index.dart';

class CircleStatusOnline extends StatefulWidget {
  double? radius;
  int status;

  CircleStatusOnline({required this.status, this.radius});

  @override
  State<CircleStatusOnline> createState() => _CircleStatusOnlineState();
}

class _CircleStatusOnlineState extends State<CircleStatusOnline> {
  Color color = greenLight;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 50), () {
      if (widget.status == 1) {
        setState(() {
          color = greenLight;
        });
      } else if (widget.status == 2) {
        setState(() {
          color = gc(context).surface;
        });
      } else {
        setState(() {
          color = const Color(0xffD4491F);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: color,
      radius: widget.radius != null ? widget.radius : 7,
    );
  }
}
