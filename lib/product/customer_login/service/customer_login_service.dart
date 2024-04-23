import 'package:demo/product/customer_login/model/customer_token_model.dart';
import 'package:demo/product/general/enum/http_methods.dart';
import 'package:demo/product/general/model/base_response.dart';
import 'package:demo/product/general/service/api_service.dart';

class CustomerLoginService extends ApiService {
  Future<BaseResponse<CustomerTokenModel>> customerLogin(
    String mail,
    String password,
  ) {
    return requestMethod<CustomerTokenModel>(
      path: '/auth/login',
      headers: {
        'Content-Type': 'application/json',
      },
      responseConverter: (p0) =>
          CustomerTokenModel.fromJson(p0 as Map<String, dynamic>),
      requestModel: {
        "email": mail,
        "password": password,
      },
      queryParameters: null,
      method: HttpMethod.post,
    );
  }

  // Future<BaseResponse<List<CategoryModel>?>?> fetch() {
  //   return requestMethod<List<CategoryModel>>(
  //     path: '/category/list',
  //     headers: {
  //       'Content-Type': 'application/json',
  //     },
  //     responseConverter: (p0) {
  //       if (p0 is List<dynamic>) {
  //         return p0
  //             .map((json) =>
  //                 CategoryModel.fromJson(json as Map<String, dynamic>))
  //             .toList();
  //       } else {
  //         // Uygun bir hata işleme stratejisi
  //         throw const FormatException(
  //             'Invalid data format for CategoryModel list');
  //       }
  //     },
  //     requestModel: null,
  //     queryParameters: null,
  //     method: HttpMethod.get,
  //   );
  // }

  // Future<BaseResponse<List<CategoryModel>?>?> get(
  //   String name,
  // ) {
  //   return requestMethod<List<CategoryModel>?>(
  //     path: '/category/list/$name',
  //     headers: {
  //       'Content-Type': 'application/json',
  //     },
  //     responseConverter: (p0) {
  //       if (p0 != null && p0 is List) {
  //         return p0.map((json) => CategoryModel.fromJson(json)).toList();
  //       }
  //       return null;
  //     },
  //     requestModel: null,
  //     queryParameters: null,
  //     method: HttpMethod.get,
  //   );
  // }

  // Future<BaseResponse<CategoryModel>?> add({
  //   required bool isActive,
  //   required String name,
  //   required int trendyolId,
  // }) {
  //   return requestMethod<CategoryModel>(
  //     path: '/category',
  //     headers: {
  //       'Content-Type': 'application/json',
  //     },
  //     responseConverter: (p0) =>
  //         CategoryModel.fromJson(p0 as Map<String, dynamic>),
  //     requestModel: {
  //       "isActive": isActive,
  //       "name": name,
  //       "trendyolId": trendyolId, //trendyolId,
  //     },
  //     queryParameters: null,
  //     method: HttpMethod.post,
  //   );
  // }

  // Future<BaseResponse<bool>> update(
  //   bool isActive,
  //   String name,
  //   int userId,
  //   int id,
  //   int trendyolId,
  // ) {
  //   return requestMethod<bool>(
  //     path: '/category',
  //     headers: {
  //       'Content-Type': 'application/json',
  //     },
  //     responseConverter: (p0) => p0,
  //     requestModel: {
  //       "isActive": isActive,
  //       "name": name,
  //       "userId": userId,
  //       "id": id,
  //       "trendyolId": trendyolId,
  //     },
  //     queryParameters: null,
  //     method: HttpMethod.put,
  //   );
  // }

  // Future<BaseResponse<bool>> delete(
  //   int id,
  // ) {
  //   return requestMethod<bool>(
  //     path: '/category/$id',
  //     headers: {
  //       'Content-Type': 'application/json',
  //     },
  //     responseConverter: (p0) => p0,
  //     requestModel: null,
  //     queryParameters: null,
  //     method: HttpMethod.delete,
  //   );
  // }
}
