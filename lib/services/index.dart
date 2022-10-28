import 'package:dio/dio.dart';
import 'package:gorilla_hash/models/enum/index.dart';
import 'package:gorilla_hash/utilities/storage/index.dart';

Dio getDio() {
  Dio dio = Dio();

  dio.options.baseUrl = "https://jsonplaceholder.typicode.com";

  dio.interceptors.add(dioInterceptors());

  return dio;
}

InterceptorsWrapper dioInterceptors() {
  return InterceptorsWrapper(onRequest: onRequest);
}

Future<void> onRequest(
  RequestOptions request,
  RequestInterceptorHandler handler,
) async {
  String? accessToken = await readST(LocalStorageFields.accessToken);

  request.headers['Authorization'] = 'Bearer $accessToken';

  return handler.next(request);
}
