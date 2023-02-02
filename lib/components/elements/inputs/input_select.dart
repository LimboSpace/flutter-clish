// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class InputSelect extends StatefulWidget {
  dynamic options;
  dynamic selectoption, optionselectedOption;
  InputSelect(this.options, this.selectoption, this.optionselectedOption);

  @override
  _Selectoptionstate createState() => _Selectoptionstate();
}

class _Selectoptionstate extends State<InputSelect> {
  double sideLength = 50;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5.0),
          topRight: Radius.circular(5.0),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            for (dynamic i = 0; i < widget.options.length; i++)
              (AnimatedContainer(
                duration: const Duration(seconds: 2),
                curve: Curves.easeIn,
                child: Material(
                  child: InkWell(
                    onTap: () {
                      widget.selectoption(widget.options[i]);
                    },
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(5.0)),
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 10, bottom: 0),
                        child: Center(
                          child: Text(widget.options[i],
                              style: const TextStyle(fontSize: 22)),
                        )),
                  ),
                ),
              ))
          ],
        ),
      ),
    );
  }
}
