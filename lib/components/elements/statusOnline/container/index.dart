import 'package:flutter/material.dart';
import 'package:gorilla_hash/components/elements/statusOnline/index.dart';
import 'package:gorilla_hash/utilities/colors/index.dart';

class StatusOnlineContainer extends StatefulWidget {
  const StatusOnlineContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<StatusOnlineContainer> createState() => _StatusOnlineContainerState();
}

class _StatusOnlineContainerState extends State<StatusOnlineContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.15),
          spreadRadius: 3,
          blurRadius: 5,
          offset: const Offset(0, 1),
        ),
      ], color: Colors.white, borderRadius: BorderRadius.circular(5)),
      padding: const EdgeInsets.only(top: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StatusOnline(
            radius: 4,
            lastOnline: DateTime.now(),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            'Activo',
            style: TextStyle(color: greenLight, fontSize: 7),
          )
        ],
      ),
    );
  }
}
