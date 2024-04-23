import 'package:demo/product/customer_login/model/customer_token_model.dart';
import 'package:demo/product/general/enum/http_methods.dart';
import 'package:demo/product/general/model/base_response.dart';
import 'package:demo/product/general/service/api_service.dart';

class CompanyRegisterService extends ApiService {
  Future<BaseResponse<CustomerTokenModel?>> companyRegister(
    String title,
    String phone,
    String email,
    String password,
  ) {
    return requestMethod<CustomerTokenModel?>(
      path: '/company/register',
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
        "title": title,
        "phone": phone,
        "email": email,
        "password": password,
        "status": true,
      },
      queryParameters: null,
      method: HttpMethod.post,
    );
  }
}
