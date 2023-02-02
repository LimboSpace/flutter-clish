import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gorilla_hash/components/elements/statusOnline/container/index.dart';
import 'package:gorilla_hash/utilities/shortcuts/index.dart';
import 'package:gorilla_hash/utilities/styles/styles.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.all(25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/transactions.svg',
                color: gc(context).primary,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Clishcoin',
                style: titlePageStyle,
              )
            ],
          ),
          Row(
            children: [
              const StatusOnlineContainer(),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.15),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: const Offset(0, 1),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  padding: const EdgeInsets.all(6),
                  child: SvgPicture.asset('assets/icons/config.svg'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
