import 'package:demo/product/customer_basket/model/customer_basket_model.dart';
import 'package:demo/product/customer_basket/service/customer_basket_service.dart';
import 'package:demo/product/general/model/base_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CustomerBasketViewModel extends ChangeNotifier {
  bool isLoading = false;
  bool isLoadingSepetiOnayla = false;
  CustomerBasketModel? basketModel;

  void changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void changeLoadingSepetiOnayla() {
    isLoadingSepetiOnayla = !isLoadingSepetiOnayla;
    notifyListeners();
  }

  void fetchBasket() async {
    changeLoading();
    BaseResponse<CustomerBasketModel?> response =
        await CustomerBasketService().fetchBasket();
    if (response.succeeded) {
      basketModel = response.data;
    } else {
      basketModel = null;
      //sepette ürün yok
      // EasyLoading.showError(
      //     "Sepette ürün bulunmadı .Error: ${response.errors}-${response.message}");
    }
    changeLoading();
    notifyListeners();
  }

  void deleteBasket() async {
    changeLoading();
    BaseResponse response = await CustomerBasketService().deleteBasket();
    if (response.succeeded) {
      fetchBasket();
    } else {
      //sepette ürün yok
      EasyLoading.showError(
          "Sepet silinemedi.Error: ${response.errors}-${response.message}");
    }
    changeLoading();
    notifyListeners();
  }

  void deleteProductBasket(int id) async {
    changeLoading();
    BaseResponse response =
        await CustomerBasketService().deleteProductBasket(id);
    if (response.succeeded) {
      EasyLoading.showSuccess("Sepetten ürün silindi.");
      fetchBasket();
    } else {
      //sepette ürün yok
      EasyLoading.showError(
          "Sepetteki ürün silinemedi.Error: ${response.errors}-${response.message}");
    }
    changeLoading();
    notifyListeners();
  }
}
