import 'package:dio/dio.dart';
import 'package:gorilla_hash/services/index.dart';
import 'package:gorilla_hash/utilities/responses/index.dart';

class BooksService {
  Future<void> get() async {}

  Future<void> create({required Map payload}) async {
    Response response = await getDio().post('path', data: payload);

    if (responseIsSuccessfull(response: response)) {}
  }

  Future<void> update({required Map payload}) async {
    Response response = await getDio().post('path', data: payload);

    if (responseIsSuccessfull(response: response)) {}
  }

  Future<void> delete({required Map payload}) async {
    Response response = await getDio().post('path', data: payload);

    if (responseIsSuccessfull(response: response)) {}
  }
}
