import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gorilla_hash/components/elements/buttons/solid/index.dart';
import 'package:gorilla_hash/utilities/colors/index.dart';
import 'package:gorilla_hash/utilities/shortcuts/index.dart';
import 'package:gorilla_hash/utilities/styles/styles.dart';

class ModalSetDollar extends StatelessWidget {
  const ModalSetDollar({
    Key? key,
    required this.onSubmit,
    required this.dollarPriceController,
    required this.relevantVolumeController,
  }) : super(key: key);

  final Function onSubmit;
  final TextEditingController dollarPriceController;
  final TextEditingController relevantVolumeController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Precio dólar', style: subTitleStyle),
        Container(
          height: 30,
          margin: const EdgeInsets.only(top: 20),
          child: TextFormField(
            controller: dollarPriceController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Ingrese aqui el precio del dolar',
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
                child: SvgPicture.asset('assets/icons/transactions.svg',
                    height: 30, color: greenLight),
              ),
              hintStyle: TextStyle(
                  color: greyText, fontSize: 16, fontStyle: FontStyle.italic),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xffD5D5D5)),
              ),
            ),
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Text('Volumen revelante', style: subTitleStyle),
        Container(
          height: 30,
          margin: const EdgeInsets.only(top: 20),
          child: TextFormField(
            controller: relevantVolumeController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Ingrese aqui el monto relevante',
              prefixIcon: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: SvgPicture.asset(
                  'assets/icons/thunder.svg',
                  height: 30,
                ),
              ),
              hintStyle: TextStyle(
                  color: greyText, fontSize: 16, fontStyle: FontStyle.italic),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xffD5D5D5)),
              ),
            ),
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 30),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: mq(context).width * 0.33,
                child: ButtonSolid(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  text: 'Cancelar',
                  color: const Color(0xffEDEEF9),
                ),
              ),
              SizedBox(
                  width: mq(context).width * 0.33,
                  child: ButtonSolid(
                    onPressed: () {
                      onSubmit(
                        relevantVolumeController.text,
                        dollarPriceController.text,
                      );
                    },
                    text: 'Aceptar',
                  )),
            ],
          ),
        )
      ],
    );
  }
}
