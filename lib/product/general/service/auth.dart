import 'package:demo/config.dart';
import 'package:demo/core/log/log.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  final Dio dio;

  AuthInterceptor(this.dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Burada istekle ilgili ek ayarlamaları yapabilirsiniz, örneğin, token eklemek gibi
    const accessToken = ""; //await secureStorageHelper.read('access_token');
    if (AppConfig.debug) Log.success('onrequestAlanında $accessToken');
    // if (accessToken != null) {
    //   options.headers['Authorization'] = 'Bearer $accessToken';
    // }
    super.onRequest(options, handler);
  }
}
