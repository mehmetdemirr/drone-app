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
      }
      if (customerAccessToken != null) {
        Log.success('onrequestAlanında $customerAccessToken');
        options.headers['Authorization'] = 'Bearer $customerAccessToken';
      }
    }

    super.onRequest(options, handler);
  }
}
