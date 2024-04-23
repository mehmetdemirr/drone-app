import 'package:demo/product/company_customer/model/company_customer_user_model.dart';
import 'package:demo/product/general/enum/http_methods.dart';
import 'package:demo/product/general/model/base_response.dart';
import 'package:demo/product/general/service/api_service.dart';

class CompanyCustomersService extends ApiService {
  //aktif kullanıcı listesindeki user companyden çıkar
  Future<BaseResponse<List<CompanyCustomerUserModel>?>> userLogoutCompany(
    int id,
  ) {
    return requestMethod<List<CompanyCustomerUserModel>?>(
      path: '/company/user-logout',
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
      requestModel: {
        "id": id, // User_id değil active Usersdeki id (pivot id)
      },
      queryParameters: null,
      method: HttpMethod.post,
    );
  }

  //bekleyen listesindeki userı companye içeri al
  Future<BaseResponse<List<CompanyCustomerUserModel>?>> userLoginCompany(
    int id,
  ) {
    return requestMethod<List<CompanyCustomerUserModel>?>(
      path: '/company/user-login',
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
      requestModel: {
        "id": id, // User_id değil active Usersdeki id (pivot id)
      },
      queryParameters: null,
      method: HttpMethod.post,
    );
  }

  //içerdeki aktif kullanıcılar
  Future<BaseResponse<List<CompanyCustomerUserModel>?>> activeUsersCompany() {
    return requestMethod<List<CompanyCustomerUserModel>?>(
      path: '/company/active-users',
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
      method: HttpMethod.post,
    );
  }

  //içerdeki aktif olmayan kullanıcılar
  Future<BaseResponse<List<CompanyCustomerUserModel>?>> inactiveUsersCompany() {
    return requestMethod<List<CompanyCustomerUserModel>?>(
      path: '/company/inactive-users',
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
      method: HttpMethod.post,
    );
  }
}
