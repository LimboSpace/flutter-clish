import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gorilla_hash/components/elements/statusOnline/container/index.dart';
import 'package:gorilla_hash/utilities/shortcuts/index.dart';
import 'package:gorilla_hash/utilities/styles/styles.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: const BoxDecoration(
          color: Color(0xff5B67CA),
          image: DecorationImage(
            image: AssetImage("assets/icons/coinsbanner.svg"),
            fit: BoxFit.cover,
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Text(
                'Monedas',
                style: titlePageStyle.copyWith(
                  color: Colors.white,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
