import 'package:demo/product/customer_company_area/model/customer_company_area_model.dart';
import 'package:demo/product/general/enum/http_methods.dart';
import 'package:demo/product/general/model/base_response.dart';
import 'package:demo/product/general/service/api_service.dart';

class CustomerCompanyAreaService extends ApiService {
  Future<BaseResponse<List<CustomerCompanyAreaModel>?>> fetchCompanyArea() {
    return requestMethod<List<CustomerCompanyAreaModel>?>(
      path: '/user/company/areas',
      headers: {
        'Content-Type': 'application/json',
      },
      responseConverter: (p0) {
        if (p0 is List) {
          return p0
              .map((json) =>
                  CustomerCompanyAreaModel.fromJson(json as Map<String, dynamic>))
              .toList();
        }
        return null;
      },
      requestModel: null,
      queryParameters: null,
      method: HttpMethod.get,
    );
  }
}
