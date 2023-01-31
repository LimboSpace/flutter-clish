import 'package:flutter/material.dart';
import 'package:gorilla_hash/components/elements/statusOnline/circles/index.dart';
import 'package:gorilla_hash/utilities/math/online.dart';

class StatusOnline extends StatefulWidget {
  double? radius;
  DateTime lastOnline;

  StatusOnline({this.radius, required this.lastOnline});

  @override
  State<StatusOnline> createState() => _StatusOnlineState();
}

class _StatusOnlineState extends State<StatusOnline> {
  int statusId = 1;

  calculate() {
    int minutes = timeLastOnline(widget.lastOnline);

    if (mounted) {
      if (minutes > 20) {
        setState(() {
          statusId = 3;
        });
      } else if (minutes > 5) {
        setState(() {
          statusId = 2;
        });
      } else {
        setState(() {
          statusId = 1;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    calculate();
  }

  @override
  Widget build(BuildContext context) {
    return CircleStatusOnline(radius: widget.radius, status: statusId);
  }
}
