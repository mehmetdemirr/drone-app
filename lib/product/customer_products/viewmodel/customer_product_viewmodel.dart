import 'package:demo/product/company_customer/model/company_customer_user_model.dart';
import 'package:demo/product/company_customer/service/company_customer_service.dart';
import 'package:demo/product/customer_products/service/customer_product_service.dart';
import 'package:demo/product/general/model/base_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CustomerProductViewModel extends ChangeNotifier {
  bool isLoading = false;
  List<CompanyCustomerUserModel>? productList;

  void changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void productListFetch() async {
    changeLoading();
    BaseResponse<List<CompanyCustomerUserModel>?> response =
        await CustomerProductService().userFetchProduct();
    if (response.succeeded) {
      productList = response.data;
    } else {
      EasyLoading.showError("Error: ${response.errors}-${response.message}");
    }
    changeLoading();
    notifyListeners();
  }
}
