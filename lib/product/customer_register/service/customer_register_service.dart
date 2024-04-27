import 'package:demo/product/customer_login/model/customer_token_model.dart';
import 'package:demo/product/general/enum/http_methods.dart';
import 'package:demo/product/general/model/base_response.dart';
import 'package:demo/product/general/service/api_service.dart';

class CustomerRegisterService extends ApiService {
  Future<BaseResponse<CustomerTokenModel>> customerRegister(
    String name,
    String surname,
    String password,
    String email,
    String phone,
    String onesignalId,
  ) {
    return requestMethod<CustomerTokenModel>(
      path: '/auth/register',
      headers: {
        'Content-Type': 'application/json',
      },
      responseConverter: (p0) =>
          CustomerTokenModel.fromJson(p0 as Map<String, dynamic>),
      requestModel: {
        "name": name,
        "surname": surname,
        "password": password,
        "email": email,
        "phone": phone,
        "onesignal_id": onesignalId,
      },
      queryParameters: null,
      method: HttpMethod.post,
    );
  }
}
