import 'package:demo/product/customer_cash/model/customer_cash_model.dart';
import 'package:demo/product/general/enum/http_methods.dart';
import 'package:demo/product/general/enum/order_status.dart';
import 'package:demo/product/general/model/base_response.dart';
import 'package:demo/product/general/service/api_service.dart';

class CustomerCashService extends ApiService {
  Future<BaseResponse<CustomerCashModel?>> getOrder(
    OrderStatusItem statusId,
    int perPage,
    int page,
  ) {
    return requestMethod<CustomerCashModel?>(
      path: '/user/order/status/${statusId.str()}',
      headers: {
        'Content-Type': 'application/json',
      },
      responseConverter: (p0) {
        if (p0 != null) {
          return CustomerCashModel.fromJson(p0 as Map<String, dynamic>);
        }
        return null;
      },
      requestModel: null,
      queryParameters: null,
      method: HttpMethod.get,
    );
  }
}
