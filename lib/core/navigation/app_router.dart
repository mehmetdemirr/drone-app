import 'package:auto_route/auto_route.dart';
import 'package:demo/product/company_cash/view/company_cash_screen.dart';
import 'package:demo/product/company_cash_edit/view/company_cash_edit_screen.dart';
import 'package:demo/product/company_home/view/company_home_screen.dart';
import 'package:demo/product/company_login/view/company_login_screen.dart';
import 'package:demo/product/company_new_order/view/company_new_order_screen.dart';
import 'package:demo/product/company_new_product/view/company_new_product_screen.dart';
import 'package:demo/product/company_order/view/company_order_screen.dart';
import 'package:demo/product/company_order_detail/view/company_order_detail_screen.dart';
import 'package:demo/product/company_product_detail/view/company_product_detail_screen.dart';
import 'package:demo/product/company_product_edit/view/company_product_edit_screen.dart';
import 'package:demo/product/company_products/view/company_products_screen.dart';
import 'package:demo/product/company_setting/view/company_setting_screen.dart';
import 'package:demo/product/company_show_qr/view/company_show_qr_screen.dart';
import 'package:demo/product/company_statistic/view/company_statistic_screen.dart';
import 'package:demo/product/customer_area_login/view/customer_area_login_screen.dart';
import 'package:demo/product/customer_cash/view/customer_cash_screen.dart';
import 'package:demo/product/customer_home/view/customer_home_screen.dart';
import 'package:demo/product/customer_login/view/customer_login_screem.dart';
import 'package:demo/product/customer_order_confirm/view/customer_order_confirm_screen.dart';
import 'package:demo/product/customer_setting/view/customer_setting_screen.dart';
import 'package:demo/product/general/view/order_success_screen.dart';
import 'package:demo/product/home_screen/home_screen.dart';
import 'package:demo/product/network_work_screen/view/post_screen.dart';
import 'package:demo/product/customer_product_detail/view/customer_product_detail_screen.dart';
import 'package:demo/product/qr_screen/view/qr_screen.dart';
import 'package:demo/product/setting_screen/setting_screen.dart';
import 'package:demo/product/splash_screen/view/splash_screen.dart';
import 'package:flutter/material.dart';

import '../../product/get_image_screen/view/get_image_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        // splash
        AutoRoute(
          path: RouterItem.splash.str(),
          page: SplashRoute.page,
        ),
        // for customer
        AutoRoute(
          path: RouterItem.customerLogin.str(),
          page: CustomerLoginRoute.page,
        ),
        AutoRoute(
          path: RouterItem.customerAreaLogin.str(),
          page: CustomerAreaLoginRoute.page,
        ),
        AutoRoute(
          path: RouterItem.customerHome.str(),
          page: CustomerHomeRoute.page,
        ),
        AutoRoute(
          path: RouterItem.qr.str(),
          page: QRViewExampleRoute.page,
        ),
        AutoRoute(
          path: RouterItem.customerProductDetail.str(),
          page: CustomerProductDetailRoute.page,
        ),
        AutoRoute(
          path: RouterItem.customerOrderConfirm.str(),
          page: CustomerOrderConfirmRoute.page,
        ),
        AutoRoute(
          path: RouterItem.customerOrderSucces.str(),
          page: OrderSuccessRoute.page,
        ),
        AutoRoute(
          path: RouterItem.customerSetting.str(),
          page: CustomerSettingRoute.page,
        ),
        AutoRoute(
          path: RouterItem.customerSetting.str(),
          page: CustomerSettingRoute.page,
        ),

        // for company
        AutoRoute(
          path: RouterItem.companyLogin.str(),
          page: CompanyLoginRoute.page,
        ),
        AutoRoute(
          path: RouterItem.companyHome.str(),
          page: CompanyHomeRoute.page,
          initial: true,
        ),
        AutoRoute(
          path: RouterItem.companyOrderDetail.str(),
          page: CompanyOrderDetailRoute.page,
        ),
        AutoRoute(
          path: RouterItem.companyNewOrder.str(),
          page: CompanyNewOrderRoute.page,
        ),
        AutoRoute(
          path: RouterItem.companySetting.str(),
          page: CompanySettingRoute.page,
        ),
        AutoRoute(
          path: RouterItem.companyProduct.str(),
          page: CompanyProductsRoute.page,
        ),
        AutoRoute(
          path: RouterItem.companyNewProduct.str(),
          page: CompanyNewProductRoute.page,
        ),
        AutoRoute(
          path: RouterItem.companyProductDetail.str(),
          page: CompanyProductDetailRoute.page,
        ),
        AutoRoute(
          path: RouterItem.companyProductEdit.str(),
          page: CompanyProductEditRoute.page,
        ),
        AutoRoute(
          path: RouterItem.companyCash.str(),
          page: CompanyCashRoute.page,
        ),
        AutoRoute(
          path: RouterItem.companyCashEdit.str(),
          page: CompanyCashEditRoute.page,
        ),

        //company just qr show screen
        AutoRoute(
          path: RouterItem.companyShowQr.str(),
          page: CompanyShowQrRoute.page,
        ),

        //other
        AutoRoute(
          path: RouterItem.home.str(),
          page: HomeRoute.page,
        ),
        AutoRoute(
          path: RouterItem.setting.str(),
          page: SettingRoute.page,
        ),
        AutoRoute(
          path: RouterItem.post.str(),
          page: PostRoute.page,
        ),
        AutoRoute(
          path: RouterItem.getImage.str(),
          page: GetImageRoute.page,
        ),
      ];
}

enum RouterItem {
  splash,
  //customer
  customerLogin,
  customerAreaLogin,
  qr,
  customerProductDetail,
  customerHome,
  customerOrderConfirm,
  customerOrderSucces,
  customerSetting,
  //company
  companyLogin,
  companyHome,
  companyOrderDetail,
  companySetting,
  companyShowQr,
  companyNewOrder,
  companyNewProduct,
  companyProduct,
  companyProductDetail,
  companyProductEdit,
  companyCash,
  companyCashEdit,
  //other
  home,
  setting,
  post,
  getImage,
}

extension RouterItems on RouterItem {
  String str() {
    switch (this) {
      case RouterItem.splash:
        return "/splash";
      //customer
      case RouterItem.customerHome:
        return "/customerHome";
      case RouterItem.qr:
        return "/qr";
      case RouterItem.customerProductDetail:
        return "/productDetail";
      case RouterItem.customerLogin:
        return "/customerLogin";
      case RouterItem.customerAreaLogin:
        return "/customerAreaLogin";
      case RouterItem.customerOrderConfirm:
        return "/customerOrderConfirm";
      case RouterItem.customerOrderSucces:
        return "/customerOrderSucces";
      case RouterItem.customerSetting:
        return "/customerSetting";

      //company
      case RouterItem.companyLogin:
        return "/companyLogin";
      case RouterItem.companyHome:
        return "/companyHome";
      case RouterItem.companyOrderDetail:
        return "/companyOrderDetail";
      case RouterItem.companySetting:
        return "/companySetting";
      case RouterItem.companyNewOrder:
        return "/companyNewOrder";
      case RouterItem.companyProduct:
        return "/companyProduct";
      case RouterItem.companyNewProduct:
        return "/companyNewProduct";
      case RouterItem.companyProductDetail:
        return "/companyProductDetail";
      case RouterItem.companyProductEdit:
        return "/companyProductEdit";
      case RouterItem.companyCash:
        return "/companyCash";
      case RouterItem.companyCashEdit:
        return "/companyCashEdit";

      // işletme için sadece qr gösterme sayfası
      case RouterItem.companyShowQr:
        return "/companyShowQr";

      //other
      case RouterItem.home:
        return "/home";
      case RouterItem.setting:
        return "/setting";
      case RouterItem.post:
        return "/post";
      case RouterItem.getImage:
        return "/getImage";
    }
  }
}
