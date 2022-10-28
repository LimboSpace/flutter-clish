import 'package:dio/dio.dart';
import 'package:gorilla_hash/services/index.dart';
import 'package:gorilla_hash/utilities/responses/index.dart';

class AuthService {
  Future<void> logIn({required Map payload}) async {
    Response response = await getDio().post('path', data: payload);

    if (responseIsSuccessfull(response: response)) {}
  }
}
