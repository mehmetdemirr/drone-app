import 'package:auto_route/auto_route.dart';
import 'package:demo/core/cache/shared_pref.dart';
import 'package:demo/core/navigation/app_router.dart';
import 'package:demo/core/utilty/images_items.dart';
import 'package:demo/product/customer_home/model/customer_info_model.dart';
import 'package:demo/product/customer_home/service/customer_info_service.dart';
import 'package:demo/product/general/model/base_response.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value) async {
      String? companyToken = await SharedPref().getCompanyToken();
      String? customerToken = await SharedPref().getCustomerToken();
      int? companyId = await SharedPref().getCompanyId();
      if (customerToken != null) {
        BaseResponse<CustomerInfoModel?> userInfo =
            await CustomerInfoService().customerInfo();
        if (userInfo.data?.activeCompany == "true") {
          //tüm routları temizle sadece customer ana sayfa kalsın
          // ignore: use_build_context_synchronously
          context.router.replaceAll(
            [
              const CustomerHomeRoute(),
            ],
          );
        } else if (userInfo.data?.activeCompany == "waiting") {
          //tüm routları temizle sadece customer ana sayfa kalsın
          // ignore: use_build_context_synchronously
          context.router.replaceAll(
            [
              const CustomerWaitingRoomRoute(),
            ],
          );
        } else if (userInfo.data?.activeCompany == "false") {
          //tüm routları temizle sadece customer ana sayfa kalsın
          // ignore: use_build_context_synchronously
          context.router.replaceAll(
            [
              const CustomerAreaLoginRoute(),
            ],
          );
        }
      } else if (companyToken != null) {
        // ignore: use_build_context_synchronously
        context.router.replaceNamed(RouterItem.companyHome.str());
      } else if (companyId != null) {
        // ignore: use_build_context_synchronously
        context.router.replaceNamed(RouterItem.companyShowQr.str());
      } else {
        // ignore: use_build_context_synchronously
        context.router.replaceNamed(RouterItem.customerLogin.str());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(ImageItem.splash.str()),
          const Text("Powered by Belek University"),
        ],
      ),
    );
  }
}
