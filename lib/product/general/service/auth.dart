import 'package:demo/config.dart';
import 'package:demo/core/cache/shared_pref.dart';
import 'package:demo/core/log/log.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  final Dio dio;

  AuthInterceptor(this.dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // Burada istekle ilgili ek ayarlamaları yapabilirsiniz, örneğin, token eklemek gibi
    String? companyAccessToken = await SharedPref().getCompanyToken();
    String? customerAccessToken = await SharedPref().getCustomerToken();
    if (AppConfig.debug) {
      if (companyAccessToken != null) {
        Log.success('onrequestAlanında $companyAccessToken');
        options.headers['Authorization'] = 'Bearer $companyAccessToken';
        options.headers['Content-Type'] = 'application/json';
        options.headers['Accept'] = 'application/json';
      }
      if (customerAccessToken != null) {
        Log.success('onrequestAlanında $customerAccessToken');
        options.headers['Authorization'] = 'Bearer $customerAccessToken';
        options.headers['Content-Type'] = 'application/json';
        options.headers['Accept'] = 'application/json';
      }
    }
    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    Log.error(err.toString());
    if (err.response?.statusCode == 401) {
      await SharedPref().setAuth(false);
      return handler.next(err);
    } else {
      return handler.next(err);
    }
  }
}
