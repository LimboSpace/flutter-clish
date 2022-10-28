import 'package:dio/dio.dart';

bool responseIsSuccessfull({required Response response}) {
  int statusCode = response.data['statusCode'] ?? 0;

  return [200, 201].contains(statusCode);
}
