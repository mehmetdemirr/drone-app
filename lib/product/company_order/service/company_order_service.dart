import 'package:demo/product/company_customer/model/company_customer_user_model.dart';
import 'package:demo/product/general/enum/http_methods.dart';
import 'package:demo/product/general/model/base_response.dart';
import 'package:demo/product/general/service/api_service.dart';

//TODO modelleri değiş
class CompanyOrderService extends ApiService {
  Future<BaseResponse<List<CompanyCustomerUserModel>?>> getOrder(
    int statusId,
    int perPage,
    int page,
  ) {
    return requestMethod<List<CompanyCustomerUserModel>?>(
      path:
          '/user/order/status?status_id=$statusId&perPage=$perPage&page=$page',
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

  Future<BaseResponse<CompanyCustomerUserModel?>> getAnOrder(
    int id,
  ) {
    return requestMethod<CompanyCustomerUserModel?>(
      path: '/company/order/$id',
      headers: {
        'Content-Type': 'application/json',
      },
      responseConverter: (p0) {
        if (p0 != null) {
          return CompanyCustomerUserModel.fromJson(p0 as Map<String, dynamic>);
        }
        return null;
      },
      requestModel: null,
      queryParameters: null,
      method: HttpMethod.get,
    );
  }

  Future<BaseResponse<CompanyCustomerUserModel?>> createOrder(
    int userId,
    int companyAreaId,
    String description,
    int statusId, //teslim edildi , hazırlanıyor gibi
    int paidStatusId, // ödendi , ödenmedi , ödenmez gibi
    List<int> productIdList,
  ) {
    return requestMethod<CompanyCustomerUserModel?>(
      path: '/company/order/',
      headers: {
        'Content-Type': 'application/json',
      },
      responseConverter: (p0) {
        if (p0 != null) {
          return CompanyCustomerUserModel.fromJson(p0 as Map<String, dynamic>);
        }
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

  Future<BaseResponse<CompanyCustomerUserModel?>> deleteOrder(
    int orderId,
  ) {
    return requestMethod<CompanyCustomerUserModel?>(
      path: '/company/order/$orderId',
      headers: {
        'Content-Type': 'application/json',
      },
      responseConverter: (p0) {
        if (p0 != null) {
          return CompanyCustomerUserModel.fromJson(p0 as Map<String, dynamic>);
        }
        return null;
      },
      requestModel: null,
      queryParameters: null,
      method: HttpMethod.delete,
    );
  }

  Future<BaseResponse<CompanyCustomerUserModel?>> changeOrderStatus(
    int orderId,
    int statusId,
  ) {
    return requestMethod<CompanyCustomerUserModel?>(
      path: '/company/order/$orderId/status/$statusId',
      headers: {
        'Content-Type': 'application/json',
      },
      responseConverter: (p0) {
        if (p0 != null) {
          return CompanyCustomerUserModel.fromJson(p0 as Map<String, dynamic>);
        }
        return null;
      },
      requestModel: null,
      queryParameters: null,
      method: HttpMethod.put,
    );
  }

  Future<BaseResponse<CompanyCustomerUserModel?>> changePaymentStatus(
    int orderId,
    int paymentId,
  ) {
    return requestMethod<CompanyCustomerUserModel?>(
      path: '/company/order/$orderId/payment/$paymentId',
      headers: {
        'Content-Type': 'application/json',
      },
      responseConverter: (p0) {
        if (p0 != null) {
          return CompanyCustomerUserModel.fromJson(p0 as Map<String, dynamic>);
        }
        return null;
      },
      requestModel: null,
      queryParameters: null,
      method: HttpMethod.put,
    );
  }
}
