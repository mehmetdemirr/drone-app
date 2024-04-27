import 'package:demo/product/company_login/model/company_model.dart';
import 'package:demo/product/general/enum/http_methods.dart';
import 'package:demo/product/general/model/base_response.dart';
import 'package:demo/product/general/service/api_service.dart';

class CompanyLoginService extends ApiService {
  Future<BaseResponse<CompanyTokenModel?>> companyLogin(
    String email,
    String password,
    String onesignalId,
  ) {
    return requestMethod<CompanyTokenModel?>(
      path: '/company/login',
      headers: {
        'Content-Type': 'application/json',
      },
      responseConverter: (p0) {
        if (p0 != null) {
          return CompanyTokenModel.fromJson(p0 as Map<String, dynamic>);
        }
        return null;
      },
      requestModel: {
        "email": email,
        "password": password,
        "onesignal_id": onesignalId,
      },
      queryParameters: null,
      method: HttpMethod.post,
    );
  }
}
