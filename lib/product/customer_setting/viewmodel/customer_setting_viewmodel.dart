import 'package:demo/product/customer_home/model/customer_info_model.dart';
import 'package:demo/product/customer_home/service/customer_info_service.dart';
import 'package:demo/product/general/model/base_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CustomerSettingViewModel extends ChangeNotifier {
  bool isLoading = false;
  CustomerInfoModel? customerInfoModel;

  void changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void fetchUserInfo() async {
    changeLoading();
    BaseResponse<CustomerInfoModel?> response =
        await CustomerInfoService().customerInfo();
    if (response.succeeded) {
      customerInfoModel = response.data;
    } else {
      EasyLoading.showError("Error: ${response.errors}-${response.message}");
    }
    changeLoading();
    notifyListeners();
  }
}
