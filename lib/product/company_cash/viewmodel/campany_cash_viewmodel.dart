import 'package:demo/product/company_cash/model/company_cash_model.dart';
import 'package:demo/product/company_cash/service/company_cash_service.dart';
import 'package:demo/product/general/enum/payment_status.dart';
import 'package:demo/product/general/model/base_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CompanyCashViewModel extends ChangeNotifier {
  bool isLoading = false;
  PaymentStatusItem paymentStatusItem = PaymentStatusItem.odemeBekleniyor;
  CompanyCashModel? orderModel;

  void changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void changePaymentStatusItem(PaymentStatusItem status) {
    paymentStatusItem = status;
    orderListFetch(1);
    notifyListeners();
  }

  void orderListFetch(int page) async {
    changeLoading();
    BaseResponse<CompanyCashModel?> response =
        await CompanyCashService().getOrder(paymentStatusItem, 1, 10);
    if (response.succeeded) {
      orderModel = response.data;
    } else {
      EasyLoading.showError("Error:${response.errors}-${response.message}");
    }
    changeLoading();
    notifyListeners();
  }
}
