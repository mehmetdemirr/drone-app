import 'package:demo/product/company_products/model/get_all_product_model.dart';
import 'package:demo/product/company_products/service/company_product_service.dart';
import 'package:demo/product/general/model/base_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CompanyProductViewModel extends ChangeNotifier {
  bool isLoading = false;
  List<CompanyProductModel>? productList;
  CompanyProductModel? productDetail;

  void changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void productListFetch() async {
    changeLoading();
    BaseResponse<List<CompanyProductModel>> response =
        await CompanyProductService().getAllProduct();
    if (response.succeeded) {
      productList = response.data;
    } else {
      EasyLoading.showError("Error:${response.errors}-${response.message}");
    }
    changeLoading();
    notifyListeners();
  }

  void productFetch(int id) async {
    changeLoading();
    BaseResponse<CompanyProductModel?> response =
        await CompanyProductService().getByIdProduct(id);
    if (response.succeeded) {
      productDetail = response.data;
    } else {
      EasyLoading.showError("Error:${response.errors}-${response.message}");
    }
    changeLoading();
    notifyListeners();
  }
}
