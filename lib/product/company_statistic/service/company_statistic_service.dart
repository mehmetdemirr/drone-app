import 'package:demo/product/company_statistic/model/company_statistic_model.dart';
import 'package:demo/product/general/enum/http_methods.dart';
import 'package:demo/product/general/model/base_response.dart';
import 'package:demo/product/general/service/api_service.dart';

class CompanyStatisticService extends ApiService {
  Future<BaseResponse<CompanyStatisticModel?>> fetchCompanyStatistic() {
    return requestMethod<CompanyStatisticModel?>(
      path: '/company/statistics',
      headers: {
        'Content-Type': 'application/json',
      },
      responseConverter: (p0) {
        if (p0 != null) {
          return CompanyStatisticModel.fromJson(p0 as Map<String, dynamic>);
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
