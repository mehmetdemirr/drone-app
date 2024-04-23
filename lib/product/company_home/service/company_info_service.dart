import 'package:demo/product/company_home/model/company_info_model.dart';
import 'package:demo/product/general/enum/http_methods.dart';
import 'package:demo/product/general/model/base_response.dart';
import 'package:demo/product/general/service/api_service.dart';

class CompanyInfoService extends ApiService {
  Future<BaseResponse<CompanyInfoModel?>> companyInfo() {
    return requestMethod<CompanyInfoModel?>(
      path: '/company',
      headers: {
        'Content-Type': 'application/json',
      },
      responseConverter: (p0) {
        if (p0 != null) {
          return CompanyInfoModel.fromJson(p0 as Map<String, dynamic>);
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
