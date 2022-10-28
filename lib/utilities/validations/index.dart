import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class ValidationUtils {
  Map validateForm(List validations, BuildContext context) {
    Map errors = {};

    for (Map validation in validations) {
      switch (validation['validation']) {
        case 'isNotEmpty':
          if (validateRequired(validation['value']) != null) {
            errors[validation['fieldName']] = 'This field is required';
          }
          break;
        case 'isEmail':
          if (validateEmail(validation['value']) != null) {
            errors[validation['fieldName']] = 'Invalid email';
          }
          break;
        case 'isPassword':
          if (validationPassword(validation['value']) != null) {
            errors[validation['fieldName']] = 'Invalid password';
          }
          break;
        case 'isNotZero':
          if (validation['value'] == 0) {
            errors[validation['fieldName']] = 'This field cannot be zero';
          }
          break;
        case 'hasPickedOne':
          if (validation['value'] == 0) {
            errors[validation['fieldName']] = 'You must pick one';
          }
          break;
        default:
      }
    }

    return errors;
  }

  String? validateRequired(String? val) {
    if (val != null && val.isNotEmpty) {
      return null;
    } else {
      return 'Este campo es requerido';
    }
  }

  String? validateEmail(String? val) {
    if (val != null && val.isNotEmpty && EmailValidator.validate(val.trim())) {
      return null;
    } else {
      return 'The email is not valid';
    }
  }

  String? validationPassword(String e) {
    if (e.isEmpty) {
      return 'Este campo es requerido';
    } else {
      if (e.length < 6) {
        return 'The password must to be stronger!';
      } else {
        return null;
      }
    }
  }

  bool validateZero(int amount) {
    return amount != 0;
  }
}
