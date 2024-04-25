import 'package:demo/product/customer_products/model/customer_product_model.dart';
import 'package:demo/product/customer_products/service/customer_product_service.dart';
import 'package:demo/product/general/model/base_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CustomerProductViewModel extends ChangeNotifier {
  bool isLoading = false;
  List<CustomerProductModel>? productList;

  void changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void productListFetch() async {
    changeLoading();
    BaseResponse<List<CustomerProductModel>?> response =
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
