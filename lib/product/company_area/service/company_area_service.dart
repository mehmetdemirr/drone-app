import 'package:demo/product/company_area/model/company_area_model.dart';
import 'package:demo/product/general/enum/http_methods.dart';
import 'package:demo/product/general/model/base_response.dart';
import 'package:demo/product/general/service/api_service.dart';

class CompanyAreaService extends ApiService {
  Future<BaseResponse<CompanyAreaModel?>> createArea(
    String title,
    String desciption,
  ) {
    return requestMethod<CompanyAreaModel?>(
      path: '/company/area',
      headers: {
        'Content-Type': 'application/json',
      },
      responseConverter: (p0) {
        if (p0 != null) {
          return CompanyAreaModel.fromJson(p0 as Map<String, dynamic>);
        } else {
          return null;
        }
      },
      requestModel: {
        "title": title,
        "description": desciption,
      },
      queryParameters: null,
      method: HttpMethod.post,
    );
  }
}
