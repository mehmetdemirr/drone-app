import 'package:demo/product/company_cash/model/company_cash_model.dart';
import 'package:demo/product/general/enum/http_methods.dart';
import 'package:demo/product/general/enum/payment_status.dart';
import 'package:demo/product/general/model/base_response.dart';
import 'package:demo/product/general/service/api_service.dart';

class CompanyCashService extends ApiService {
  Future<BaseResponse<CompanyCashModel?>> getOrder(
    PaymentStatusItem statusId,
    int perPage,
    int page,
  ) {
    return requestMethod<CompanyCashModel?>(
      path: '/company/order/payment/${statusId.str()}',
      headers: {
        'Content-Type': 'application/json',
      },
      responseConverter: (p0) {
        if (p0 != null) {
          return CompanyCashModel.fromJson(p0 as Map<String, dynamic>);
        }
        return null;
      },
      requestModel: null,
      queryParameters: null,
      method: HttpMethod.get,
    );
  }
}
