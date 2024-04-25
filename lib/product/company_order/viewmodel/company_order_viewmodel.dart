import 'package:demo/product/company_order/model/company_order_model.dart';
import 'package:demo/product/company_order/service/company_order_service.dart';
import 'package:demo/product/general/enum/order_status.dart';
import 'package:demo/product/general/model/base_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CompanyOrderViewModel extends ChangeNotifier {
  bool isLoading = false;
  OrderStatusItem orderStatusItem = OrderStatusItem.tumu;
  List<CompanyOrderModel>? orderList;

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
    BaseResponse<List<CompanyOrderModel>?> response =
        await CompanyOrderService().getOrder(orderStatusItem, 10, page);
    if (response.succeeded) {
      orderList = response.data;
    } else {
      EasyLoading.showError("Error:${response.errors}-${response.message}");
    }
    changeLoading();
    notifyListeners();
  }
}
