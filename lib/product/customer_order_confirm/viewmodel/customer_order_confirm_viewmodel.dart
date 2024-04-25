import 'package:demo/product/customer_company_area/model/customer_company_area_model.dart';
import 'package:demo/product/customer_company_area/service/customer_company_area_service.dart';
import 'package:demo/product/general/model/base_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CustomerOrderConfirmViewModel extends ChangeNotifier {
  bool isLoading = false;
  List<CustomerCompanyAreaModel>? companyAreaList;

  void changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void fetchCompanyArea() async {
    changeLoading();
    BaseResponse<List<CustomerCompanyAreaModel>?> response =
        await CustomerCompanyAreaService().fetchCompanyArea();
    if (response.succeeded) {
      companyAreaList = response.data;
    } else {
      EasyLoading.showError("Error: ${response.errors}-${response.message}");
    }
    changeLoading();
    notifyListeners();
  }
}
