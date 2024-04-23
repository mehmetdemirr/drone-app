import 'package:demo/product/general/enum/http_methods.dart';
import 'package:demo/product/general/model/base_response.dart';
import 'package:demo/product/general/service/api_service.dart';

class CustomerBasketService extends ApiService {
  Future<BaseResponse> addProductBasket(
    int productId,
    int companyAreaId,
    String desciption,
  ) async {
    return requestMethod(
      path: '/user/order',
      headers: {
        'Content-Type': 'application/json',
      },
      responseConverter: (p0) {},
      requestModel: {
        "product_id": productId,
        "company_area_id": companyAreaId,
        "description": desciption,
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

  Future<BaseResponse> fetchBasket() async {
    return requestMethod(
      path: '/user/order',
      headers: {
        'Content-Type': 'application/json',
      },
      responseConverter: (p0) {},
      requestModel: null,
      queryParameters: null,
      method: HttpMethod.get,
    );
  }

  Future<BaseResponse> confirmBasket(
    double lat,
    double long,
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
      },
      queryParameters: null,
      method: HttpMethod.post,
    );
  }
}
