import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gorilla_hash/utilities/shortcuts/index.dart';

class InputSearch extends StatefulWidget {
  Function onSubmit;
  double? width;
  TextEditingController controller;

  InputSearch({required this.onSubmit, this.width, required this.controller});

  @override
  State<InputSearch> createState() => _InputSearchState();
}

class _InputSearchState extends State<InputSearch> {
  TextEditingController wordToSearch = TextEditingController();
  final _formKeySearch = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 10, top: 10),
        padding: const EdgeInsets.only(left: 20, right: 10, top: 0, bottom: 0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            color: Colors.white,
            borderRadius: BorderRadius.circular(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                widget.onSubmit(widget.controller.text);
              },
              child: const FaIcon(
                FontAwesomeIcons.magnifyingGlass,
                size: 20,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              height: mq(context).height * 0.06,
              width: widget.width ?? MediaQuery.of(context).size.width * 0.7,
              child: Form(
                key: _formKeySearch,
                child: TextFormField(
                  textInputAction: TextInputAction.search,
                  onFieldSubmitted: (e) {
                    widget.onSubmit(wordToSearch.text);
                  },
                  controller: widget.controller,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintStyle: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w300),
                      hintText: 'Buscar'),
                ),
              ),
            ),
          ],
        ));
  }
}
