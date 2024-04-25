import 'package:demo/product/company_customer/model/company_customer_user_model.dart';
import 'package:demo/product/company_customer/service/company_customer_service.dart';
import 'package:demo/product/general/model/base_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CompanyCustomerViewModel extends ChangeNotifier {
  bool isLoading = false;
  int status = 1; // 1 => onay bekleyen  2 => içerdeki müşteri
  List<CompanyCustomerUserModel>? musteriList;

  void changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void changeStatus(int value) {
    status = value;
    userListFetch();
    notifyListeners();
  }

  void userListFetch() async {
    changeLoading();
    if (status == 1) {
      BaseResponse<List<CompanyCustomerUserModel>?> response =
          await CompanyCustomersService().inactiveUsersCompany();
      if (response.succeeded) {
        musteriList = response.data;
      } else {
        EasyLoading.showError("Error: ${response.errors}-${response.message}");
      }
    } else if (status == 2) {
      BaseResponse<List<CompanyCustomerUserModel>?> response1 =
          await CompanyCustomersService().activeUsersCompany();
      if (response1.succeeded) {
        musteriList = response1.data;
      } else {
        EasyLoading.showError(
            "Error: ${response1.errors}-${response1.message}");
      }
    }
    changeLoading();
    notifyListeners();
  }

  void musteriSil(int id) async {
    BaseResponse response =
        await CompanyCustomersService().deletUserCompany(id);
    if (response.succeeded) {
      EasyLoading.showSuccess("Bekleyen müşteri silindi");
      userListFetch();
      notifyListeners();
    } else {
      EasyLoading.showError(
          "Bekleyen müşteri silinemedi.Error:${response.errors}-${response.message}");
    }
  }

  void musteriyiOnayBekleyenlereGonder(int id) async {
    BaseResponse response =
        await CompanyCustomersService().userLogoutCompany(id);
    if (response.succeeded) {
      EasyLoading.showSuccess("Aktif müşteriyi onay bekleyen hala geldi.");
      userListFetch();
      notifyListeners();
    } else {
      EasyLoading.showError(
          "Bekleyen müşteri silinemedi.Error:${response.errors}-${response.message}");
    }
  }

  void musteriOnayla(int id) async {
    BaseResponse response =
        await CompanyCustomersService().userLoginCompany(id);
    if (response.succeeded) {
      EasyLoading.showSuccess("Bekleyen müşteri onaylandı");
      userListFetch();
      notifyListeners();
    } else {
      EasyLoading.showError(
          "Bekleyen müşteri onaylanmadı.Error:${response.errors}-${response.message}");
    }
  }
}
