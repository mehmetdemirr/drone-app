import 'package:auto_route/auto_route.dart';
import 'package:demo/product/company_cash/view/company_cash_screen.dart';
import 'package:demo/product/company_cash_edit/view/company_cash_edit_screen.dart';
import 'package:demo/product/company_customer/view/company_customer_screen.dart';
import 'package:demo/product/company_feed_back/view/company_feed_back_screen.dart';
import 'package:demo/product/company_home/view/company_home_screen.dart';
import 'package:demo/product/company_login/view/company_login_screen.dart';
import 'package:demo/product/company_new_area/view/company_new_area_screen.dart';
import 'package:demo/product/company_new_order/view/company_new_order_screen.dart';
import 'package:demo/product/company_new_product/view/company_new_product_screen.dart';
import 'package:demo/product/company_order/view/company_order_screen.dart';
import 'package:demo/product/company_order_detail/view/company_order_detail_screen.dart';
import 'package:demo/product/company_product_detail/view/company_product_detail_screen.dart';
import 'package:demo/product/company_product_edit/view/company_product_edit_screen.dart';
import 'package:demo/product/company_products/view/company_products_screen.dart';
import 'package:demo/product/company_register/view/company_register_screen.dart';
import 'package:demo/product/company_setting/view/company_setting_screen.dart';
import 'package:demo/product/company_show_qr/view/company_show_qr_screen.dart';
import 'package:demo/product/company_statistic/view/company_statistic_screen.dart';
import 'package:demo/product/company_status_false/view/company_status_false_screen.dart';
import 'package:demo/product/customer_area_login/view/customer_area_login_screen.dart';
import 'package:demo/product/customer_cash/view/customer_cash_screen.dart';
import 'package:demo/product/customer_home/view/customer_home_screen.dart';
import 'package:demo/product/customer_login/view/customer_login_screem.dart';
import 'package:demo/product/customer_order_confirm/view/customer_order_confirm_screen.dart';
import 'package:demo/product/customer_register/view/customer_register_screen.dart';
import 'package:demo/product/customer_setting/view/customer_setting_screen.dart';
import 'package:demo/product/customer_statistic/view/customer_statistic_screen.dart';
import 'package:demo/product/customer_waiting_room/view/customer_waiting_room_screen.dart';
import 'package:demo/product/general/view/order_success_screen.dart';
import 'package:demo/product/home_screen/home_screen.dart';
import 'package:demo/product/customer_product_detail/view/customer_product_detail_screen.dart';
import 'package:demo/product/qr_screen/view/qr_screen.dart';
import 'package:demo/product/setting_screen/setting_screen.dart';
import 'package:demo/product/splash_screen/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

import '../../product/get_image_screen/view/get_image_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen|Page,Route',
)
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        // splash
        CustomRoute(
          path: RouterItem.companyHome.str(),
          page: SplashRoute.page,
          initial: true,
        ),
        // for customer
        CustomRoute(
          path: RouterItem.customerLogin.str(),
          page: CustomerLoginRoute.page,
        ),
        CustomRoute(
          path: RouterItem.customerRegister.str(),
          page: CustomerRegisterRoute.page,
        ),
        CustomRoute(
          path: RouterItem.customerAreaLogin.str(),
          page: CustomerAreaLoginRoute.page,
        ),
        CustomRoute(
          path: RouterItem.customerHome.str(),
          page: CustomerHomeRoute.page,
        ),
        CustomRoute(
          path: RouterItem.customerProductDetail.str(),
          page: CustomerProductDetailRoute.page,
        ),
        CustomRoute(
          path: RouterItem.customerOrderConfirm.str(),
          page: CustomerOrderConfirmRoute.page,
        ),
        CustomRoute(
          path: RouterItem.customerOrderSucces.str(),
          page: OrderSuccessRoute.page,
        ),
        CustomRoute(
          path: RouterItem.customerSetting.str(),
          page: CustomerSettingRoute.page,
        ),
        CustomRoute(
          path: RouterItem.customerSetting.str(),
          page: CustomerSettingRoute.page,
        ),
        CustomRoute(
          path: RouterItem.customerStatistic.str(),
          page: CustomerStatisticRoute.page,
        ),
        CustomRoute(
          path: RouterItem.customerWaitingRoom.str(),
          page: CustomerWaitingRoomRoute.page,
        ),
        // for company
        CustomRoute(
          path: RouterItem.companyLogin.str(),
          page: CompanyLoginRoute.page,
        ),
        CustomRoute(
          path: RouterItem.companyRegister.str(),
          page: CompanyRegisterRoute.page,
        ),
        CustomRoute(
          path: RouterItem.companyHome.str(),
          page: CompanyHomeRoute.page,
        ),
        CustomRoute(
          path: RouterItem.companyOrderDetail.str(),
          page: CompanyOrderDetailRoute.page,
        ),
        CustomRoute(
          path: RouterItem.companyNewOrder.str(),
          page: CompanyNewOrderRoute.page,
        ),
        CustomRoute(
          path: RouterItem.companySetting.str(),
          page: CompanySettingRoute.page,
        ),
        CustomRoute(
          path: RouterItem.companyProduct.str(),
          page: CompanyProductsRoute.page,
        ),
        CustomRoute(
          path: RouterItem.companyNewProduct.str(),
          page: CompanyNewProductRoute.page,
        ),
        CustomRoute(
          path: RouterItem.companyProductDetail.str(),
          page: CompanyProductDetailRoute.page,
        ),
        CustomRoute(
          path: RouterItem.companyProductEdit.str(),
          page: CompanyProductEditRoute.page,
        ),
        CustomRoute(
          path: RouterItem.companyCash.str(),
          page: CompanyCashRoute.page,
        ),
        CustomRoute(
          path: RouterItem.companyCashEdit.str(),
          page: CompanyCashEditRoute.page,
        ),
        CustomRoute(
          path: RouterItem.companyFeedBack.str(),
          page: CompanyFeedBackRoute.page,
        ),
        CustomRoute(
          path: RouterItem.companyStatusFalse.str(),
          page: CompanyStatusFalseRoute.page,
        ),
        CustomRoute(
          path: RouterItem.companyNewArea.str(),
          page: CompanyNewAreaRoute.page,
        ),
        //company just qr show screen
        CustomRoute(
          path: RouterItem.companyShowQr.str(),
          page: CompanyShowQrRoute.page,
        ),

        //other
        CustomRoute(
          path: RouterItem.home.str(),
          page: HomeRoute.page,
        ),
        CustomRoute(
          path: RouterItem.setting.str(),
          page: SettingRoute.page,
        ),
        CustomRoute(
          path: RouterItem.getImage.str(),
          page: GetImageRoute.page,
        ),

        // guards: const [
        //   // //TODO bunun testini yap
        //   // AutoRouteGuard.simple((resolver, router) async {
        //   //   bool isAuthendicated = await SharedPref().getAuth();
        //   //   if (!isAuthendicated) {
        //   //     EasyLoading.showError("Erişiminiz yok ! Çıkış yapılıyor ...");
        //   //     resolver.redirect(const SplashRoute());
        //   //   } else {
        //   //     resolver.next();
        //   //   }
        //   // }),
        // ],
      ];
}

enum RouterItem {
  splash,
  //customer
  customerLogin,
  customerRegister,
  customerAreaLogin,
  qr,
  customerProductDetail,
  customerHome,
  customerOrderConfirm,
  customerOrderSucces,
  customerSetting,
  customerStatistic,
  customerWaitingRoom,
  //company
  companyLogin,
  companyRegister,
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
  companyFeedBack,
  companyStatusFalse,
  companyNewArea,
  //other
  home,
  setting,
  getImage,
}

extension RouterItems on RouterItem {
  String str() {
    return "/$name";
  }
}
