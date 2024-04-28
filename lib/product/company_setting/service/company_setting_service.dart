import 'package:demo/product/general/enum/http_methods.dart';
import 'package:demo/product/general/model/base_response.dart';
import 'package:demo/product/general/service/api_service.dart';

class CompanySettingService extends ApiService {
  Future<BaseResponse> companyLogout() {
    return requestMethod(
      path: '/company/logout',
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
