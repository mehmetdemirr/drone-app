import 'package:demo/product/customer_basket/model/customer_basket_model.dart';
import 'package:demo/product/general/enum/http_methods.dart';
import 'package:demo/product/general/model/base_response.dart';
import 'package:demo/product/general/service/api_service.dart';

class CustomerBasketService extends ApiService {
  Future<BaseResponse> addProductBasket(
    int productId,
  ) async {
    return requestMethod(
      path: '/user/order',
      headers: {
        'Content-Type': 'application/json',
      },
      responseConverter: (p0) {},
      requestModel: {
        "product_id": productId,
      },
      queryParameters: null,
      method: HttpMethod.post,
    );
  }

  Future<BaseResponse> deleteProductBasket(
    int productId,
  ) async {
    return requestMethod(
      path: '/user/order/product/$productId',
      headers: {
        'Content-Type': 'application/json',
      },
      responseConverter: (p0) {},
      requestModel: null,
      queryParameters: null,
      method: HttpMethod.delete,
    );
  }

  Future<BaseResponse> deleteBasket() async {
    return requestMethod(
      path: '/user/order',
      headers: {
        'Content-Type': 'application/json',
      },
      responseConverter: (p0) {},
      requestModel: null,
      queryParameters: null,
      method: HttpMethod.delete,
    );
  }

  Future<BaseResponse<CustomerBasketModel?>> fetchBasket() async {
    return requestMethod(
      path: '/user/order',
      headers: {
        'Content-Type': 'application/json',
      },
      responseConverter: (p0) {
        if (p0 != null) {
          return CustomerBasketModel.fromJson(p0 as Map<String, dynamic>);
        } else {
          return null;
        }
      },
      requestModel: null,
      queryParameters: null,
      method: HttpMethod.get,
    );
  }

  Future<BaseResponse> confirmBasket(
    double lat,
    double long,
    String description,
    int areaId,
  ) async {
    return requestMethod(
      path: '/user/order/confirm',
      headers: {
        'Content-Type': 'application/json',
      },
      responseConverter: (p0) {},
      requestModel: {
        "location_latitude": lat,
        "location_longitude": long,
        "description": description,
        "company_area_id": areaId,
      },
      queryParameters: null,
      method: HttpMethod.post,
    );
  }
}
