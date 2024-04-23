import 'package:demo/product/company_customer/model/company_customer_user_model.dart';
import 'package:demo/product/general/enum/http_methods.dart';
import 'package:demo/product/general/model/base_response.dart';
import 'package:demo/product/general/service/api_service.dart';

//TODO modelleri değiş
class CustomerProductService extends ApiService {
  Future<BaseResponse<List<CompanyCustomerUserModel>?>> userFetchProduct() {
    return requestMethod<List<CompanyCustomerUserModel>?>(
      path: '/user/company/product',
      headers: {
        'Content-Type': 'application/json',
      },
      responseConverter: (p0) {
        if (p0 is List) {
          return p0
              .map((json) => CompanyCustomerUserModel.fromJson(
                  json as Map<String, dynamic>))
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
