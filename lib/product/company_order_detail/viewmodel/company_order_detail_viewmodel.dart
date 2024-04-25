import 'package:demo/product/company_order/service/company_order_service.dart';
import 'package:demo/product/company_order_detail/model/company_order_details_model.dart';
import 'package:demo/product/general/model/base_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CompanyOrderDetailViewModel extends ChangeNotifier {
  bool isLoading = false;
  CompanyOrderDetailModel? orderModel;

  void changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void fetchOrderDetail(int id) async {
    changeLoading();
    BaseResponse<CompanyOrderDetailModel?> response =
        await CompanyOrderService().getAnOrder(id);
    if (response.succeeded) {
      orderModel = response.data;
    } else {
      EasyLoading.showError("Error:${response.errors}-${response.message}");
    }
    changeLoading();
    notifyListeners();
  }
}
