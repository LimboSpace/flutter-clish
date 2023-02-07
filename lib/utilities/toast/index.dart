// ignore_for_file: prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

showToast(context, String mode, String text, int? seconds) {
  switch (mode) {
    case 'success':
      MotionToast.success(
          height: 50,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          toastDuration: Duration(seconds: seconds == null ? 1 : seconds),
          description: Text(text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ))).show(context);
      break;
    case 'error':
      MotionToast.error(
          height: 50,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          toastDuration: Duration(seconds: seconds == null ? 1 : seconds),
          description: Text(text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ))).show(context);
      break;
    default:
  }
}
