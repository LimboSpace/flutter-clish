import 'package:dio/dio.dart';
import 'package:gorilla_hash/models/enum/index.dart';
import 'package:gorilla_hash/utilities/storage/index.dart';

Dio getDio() {
  Dio dio = Dio();

  return dio;
}

InterceptorsWrapper dioInterceptors() {
  return InterceptorsWrapper(onRequest: onRequest);
}

Future<void> onRequest(
  RequestOptions request,
  RequestInterceptorHandler handler,
) async {
  String? accessToken = await readST(LocalStorageFields.accessToken, 'string');

  request.headers['Authorization'] = 'Bearer $accessToken';

  return handler.next(request);
}
