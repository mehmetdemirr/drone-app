import 'package:demo/product/customer_products/model/customer_product_model.dart';
import 'package:demo/product/general/enum/http_methods.dart';
import 'package:demo/product/general/model/base_response.dart';
import 'package:demo/product/general/service/api_service.dart';

class CustomerProductService extends ApiService {
  Future<BaseResponse<List<CustomerProductModel>?>> userFetchProduct() {
    return requestMethod<List<CustomerProductModel>?>(
      path: '/user/company/product',
      headers: {
        'Content-Type': 'application/json',
      },
      responseConverter: (p0) {
        if (p0 is List) {
          return p0
              .map((json) =>
                  CustomerProductModel.fromJson(json as Map<String, dynamic>))
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
