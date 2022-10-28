import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future<void> takePicture(
    {required BuildContext context,
    required void Function(Uint8List?) setPathPhoto}) async {
  final ImagePicker picker = ImagePicker();

  final XFile? photo = await picker.pickImage(source: ImageSource.camera);

  if (photo == null) return;

  setPathPhoto(await photo.readAsBytes());
}

Future<void> pickPhoto(
    {required void Function(Uint8List?) setPathPhoto}) async {
  final ImagePicker picker = ImagePicker();

  final XFile? photo;

  photo = await picker.pickImage(source: ImageSource.gallery);

  if (photo == null) return;

  setPathPhoto(await photo.readAsBytes());
}
