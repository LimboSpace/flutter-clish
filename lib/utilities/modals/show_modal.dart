import 'package:flutter/material.dart';

openDialog(context, body) {
  return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(content: body);
      });
}
