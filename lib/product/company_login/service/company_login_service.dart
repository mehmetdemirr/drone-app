import 'package:demo/product/customer_login/model/customer_token_model.dart';
import 'package:demo/product/general/enum/http_methods.dart';
import 'package:demo/product/general/model/base_response.dart';
import 'package:demo/product/general/service/api_service.dart';

class CompanyLoginService extends ApiService {
  Future<BaseResponse<CustomerTokenModel?>> companyLogin(
    String email,
    String password,
  ) {
    return requestMethod<CustomerTokenModel?>(
      path: '/company/login',
      headers: {
        'Content-Type': 'application/json',
      },
      responseConverter: (p0) {
        if (p0 != null) {
          return CustomerTokenModel.fromJson(p0 as Map<String, dynamic>);
        }
        return null;
      },
      requestModel: {
        "email": email,
        "password": password,
      },
      queryParameters: null,
      method: HttpMethod.post,
    );
  }
}
