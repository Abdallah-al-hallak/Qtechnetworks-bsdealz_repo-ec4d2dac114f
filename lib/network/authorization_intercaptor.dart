import 'package:dio/dio.dart';

import '../utils/shared_func.dart';

class AuthorizationInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    var token = await getTokenStorage();
    options.headers['Authorization'] = 'Bearer $token';

    super.onRequest(options, handler);
  }
}
