import 'package:flutter/material.dart';

class HeaderTable extends StatelessWidget {
  const HeaderTable({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return Container(
      margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color.fromARGB(45, 248, 188, 24)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: const Center(
                  child: Text(
                'Cambio',
                style: TextStyle(
                    color: Color(0xffF8BB18), fontWeight: FontWeight.bold),
              )),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              decoration: BoxDecoration(color: const Color(0xffF8BB18)),
              child: const Center(
                  child: Text(
                'Min - Max',
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold),
              )),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: const Center(
                  child: Text(
                '%',
                style: TextStyle(
                    color: Color(0xffF8BB18), fontWeight: FontWeight.bold),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
