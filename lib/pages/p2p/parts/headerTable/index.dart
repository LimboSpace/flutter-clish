import 'package:flutter/material.dart';
import 'package:gorilla_hash/components/elements/inputs/search.dart';
import 'package:gorilla_hash/utilities/shortcuts/index.dart';

class HeaderTable extends StatefulWidget {
  const HeaderTable({super.key});

  @override
  State<HeaderTable> createState() => _HeaderTableState();
}

class _HeaderTableState extends State<HeaderTable> {
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return Container(
      margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xffFFF8E7)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: InputSearch(
                width: mq(context).width * 0.45,
                controller: searchController,
                onSubmit: () {}),
          ),
          Expanded(
            flex: 6,
            child: Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              decoration: BoxDecoration(color: gc(context).surface),
              child: const Center(
                  child: Text(
                'Min - Max',
                style: TextStyle(
                    color: Color(0xffFFF8E7), fontWeight: FontWeight.bold),
              )),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Center(
                  child: Text(
                '%',
                style: TextStyle(
                    color: gc(context).surface, fontWeight: FontWeight.bold),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
