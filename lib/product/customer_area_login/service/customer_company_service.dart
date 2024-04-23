import 'package:demo/product/general/enum/http_methods.dart';
import 'package:demo/product/general/model/base_response.dart';
import 'package:demo/product/general/service/api_service.dart';

class CustomerCompanyService extends ApiService {
  Future<BaseResponse> userEnterCompany(
    int companyId,
  ) {
    return requestMethod(
      path: '/user/login-company',
      headers: {
        'Content-Type': 'application/json',
      },
      responseConverter: (p0) {
        return null;
      },
      requestModel: {
        "company_id": companyId,
      },
      queryParameters: null,
      method: HttpMethod.post,
    );
  }

  Future<BaseResponse> userLogoutCompany() {
    return requestMethod(
      path: '/user/logout-company',
      headers: {
        'Content-Type': 'application/json',
      },
      responseConverter: (p0) {
        return null;
      },
      requestModel: null,
      queryParameters: null,
      method: HttpMethod.post,
    );
  }
}
