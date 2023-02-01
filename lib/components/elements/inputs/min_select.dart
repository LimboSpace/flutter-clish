import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MinSelect extends StatefulWidget {
  Function openOptions;
  String label;

  MinSelect({required this.label, required this.openOptions});

  @override
  State<MinSelect> createState() => _MinSelectState();
}

class _MinSelectState extends State<MinSelect> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.openOptions();
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 10),
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.label,
              style: const TextStyle(color: Colors.grey),
            ),
            const FaIcon(
              FontAwesomeIcons.chevronDown,
              color: Colors.grey,
              size: 12,
            )
          ],
        ),
      ),
    );
  }
}
