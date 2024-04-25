import 'package:demo/product/company_order_detail/model/company_order_details_model.dart';
import 'package:demo/product/company_order/model/company_order_model.dart';
import 'package:demo/product/general/enum/http_methods.dart';
import 'package:demo/product/general/enum/order_status.dart';
import 'package:demo/product/general/model/base_response.dart';
import 'package:demo/product/general/service/api_service.dart';

class CompanyOrderService extends ApiService {
  Future<BaseResponse<CompanyOrderModel?>> getOrder(
    OrderStatusItem statusId,
    int perPage,
    int page,
  ) {
    return requestMethod<CompanyOrderModel?>(
      path: '/company/order/status/${statusId.str()}',
      headers: {
        'Content-Type': 'application/json',
      },
      responseConverter: (p0) {
        if (p0 != null) {
          return CompanyOrderModel.fromJson(p0 as Map<String, dynamic>);
        }
        return null;
      },
      requestModel: null,
      queryParameters: null,
      method: HttpMethod.get,
    );
  }

  Future<BaseResponse<CompanyOrderDetailModel?>> getAnOrder(
    int id,
  ) {
    return requestMethod<CompanyOrderDetailModel?>(
      path: '/company/order/$id',
      headers: {
        'Content-Type': 'application/json',
      },
      responseConverter: (p0) {
        if (p0 != null) {
          return CompanyOrderDetailModel.fromJson(p0 as Map<String, dynamic>);
        }
        return null;
      },
      requestModel: null,
      queryParameters: null,
      method: HttpMethod.get,
    );
  }

  Future<BaseResponse> createOrder(
    int userId,
    int companyAreaId,
    String description,
    int statusId, //teslim edildi , hazırlanıyor gibi
    int paidStatusId, // ödendi , ödenmedi , ödenmez gibi
    List<int> productIdList,
  ) {
    return requestMethod(
      path: '/company/order/',
      headers: {
        'Content-Type': 'application/json',
      },
      responseConverter: (p0) {
        return null;
      },
      requestModel: {
        "user_id": userId,
        "company_area_id": companyAreaId,
        "description": description,
        "status_id": statusId,
        "paid_status_id": paidStatusId,
        "product_ids": productIdList,
      },
      queryParameters: null,
      method: HttpMethod.post,
    );
  }

  Future<BaseResponse> deleteOrder(
    int orderId,
  ) {
    return requestMethod(
      path: '/company/order/$orderId',
      headers: {
        'Content-Type': 'application/json',
      },
      responseConverter: (p0) {
        return null;
      },
      requestModel: null,
      queryParameters: null,
      method: HttpMethod.delete,
    );
  }

  Future<BaseResponse> changeOrderStatus(
    int orderId,
    int statusId,
  ) {
    return requestMethod(
      path: '/company/order/$orderId/status/$statusId',
      headers: {
        'Content-Type': 'application/json',
      },
      responseConverter: (p0) {
        return null;
      },
      requestModel: null,
      queryParameters: null,
      method: HttpMethod.put,
    );
  }

  Future<BaseResponse> changePaymentStatus(
    int orderId,
    int paymentId,
  ) {
    return requestMethod(
      path: '/company/order/$orderId/payment/$paymentId',
      headers: {
        'Content-Type': 'application/json',
      },
      responseConverter: (p0) {},
      requestModel: null,
      queryParameters: null,
      method: HttpMethod.put,
    );
  }
}
