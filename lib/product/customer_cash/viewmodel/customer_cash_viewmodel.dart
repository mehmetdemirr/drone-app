import 'package:demo/product/customer_cash/model/customer_cash_model.dart';
import 'package:demo/product/customer_cash/service/customer_cash_service.dart';
import 'package:demo/product/general/enum/order_status.dart';
import 'package:demo/product/general/model/base_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CustomerCashViewModel extends ChangeNotifier {
  bool isLoading = false;
  OrderStatusItem orderStatusItem = OrderStatusItem.tumu;
  CustomerCashModel? orderModel;

  void changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void changeOrderStatusItem(OrderStatusItem status) {
    orderStatusItem = status;
    orderListFetch(1);
    notifyListeners();
  }

  void orderListFetch(int page) async {
    changeLoading();
    BaseResponse<CustomerCashModel?> response =
        await CustomerCashService().getOrder(orderStatusItem, 10, page);
    if (response.succeeded) {
      orderModel = response.data;
    } else {
      EasyLoading.showError("Error:${response.errors}-${response.message}");
    }
    changeLoading();
    notifyListeners();
  }
}
