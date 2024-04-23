import 'package:demo/product/customer_home/model/customer_info_model.dart';
import 'package:demo/product/general/enum/http_methods.dart';
import 'package:demo/product/general/model/base_response.dart';
import 'package:demo/product/general/service/api_service.dart';

class CustomerInfoService extends ApiService {
  Future<BaseResponse<CustomerInfoModel?>> companyInfo() {
    return requestMethod<CustomerInfoModel?>(
      path: '/user',
      headers: {
        'Content-Type': 'application/json',
      },
      responseConverter: (p0) {
        if (p0 != null) {
          return CustomerInfoModel.fromJson(p0 as Map<String, dynamic>);
        } else {
          return null;
        }
      },
      requestModel: null,
      queryParameters: null,
      method: HttpMethod.get,
    );
  }
}
