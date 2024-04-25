import 'package:demo/product/company_statistic/model/company_statistic_model.dart';
import 'package:demo/product/company_statistic/service/company_statistic_service.dart';
import 'package:demo/product/general/model/base_response.dart';
import 'package:flutter/material.dart';

class CompanyStatisticViewModel extends ChangeNotifier {
  bool isLoading = false;
  CompanyStatisticModel? companyStatisticModel;

  void changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void fetchCompanyStatistic() async {
    changeLoading();
    BaseResponse<CompanyStatisticModel?> response =
        await CompanyStatisticService().fetchCompanyStatistic();
    if (response.succeeded) {
      companyStatisticModel = response.data;
    } else {
      companyStatisticModel = null;
    }
    changeLoading();
    notifyListeners();
  }
}
