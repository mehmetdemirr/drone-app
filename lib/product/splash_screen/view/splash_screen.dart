import 'package:auto_route/auto_route.dart';
import 'package:demo/core/cache/shared_pref.dart';
import 'package:demo/core/navigation/app_router.dart';
import 'package:demo/core/utilty/images_items.dart';
import 'package:demo/product/company_home/model/company_info_model.dart';
import 'package:demo/product/company_home/service/company_info_service.dart';
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
    Future.delayed(Duration.zero).then((value) async {
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
        BaseResponse<CompanyInfoModel?> companyInfo =
            await CompanyInfoService().companyInfo();
        if (companyInfo.data?.status == "1") {
          //tüm routları temizle sadece company ana sayfa kalsın
          // ignore: use_build_context_synchronously
          context.router.replaceAll(
            [
              const CompanyHomeRoute(),
            ],
          );
        } else if (companyInfo.data?.status == "0") {
          //tüm routları temizle sadece customer ana sayfa kalsın
          // ignore: use_build_context_synchronously
          context.router.replaceAll(
            [
              const CompanyStatusFalseRoute(),
            ],
          );
        } else {
          // ignore: use_build_context_synchronously
          context.router.replaceNamed(RouterItem.customerLogin.str());
        }
      } else if (companyId != null) {
        BaseResponse<CompanyInfoModel?> companyInfo =
            await CompanyInfoService().companyInfo();
        if (companyInfo.data?.status == "1") {
          //tüm routları temizle sadece company qr kalsın
          // ignore: use_build_context_synchronously
          context.router.replaceAll(
            [
              const CompanyShowQrRoute(),
            ],
          );
        } else if (companyInfo.data?.status == "0") {
          //tüm routları temizle sadece customer ana sayfa kalsın
          // ignore: use_build_context_synchronously
          context.router.replaceAll(
            [
              const CompanyStatusFalseRoute(),
            ],
          );
        } else {
          // ignore: use_build_context_synchronously
          context.router.replaceNamed(RouterItem.customerLogin.str());
        }
      } else {
        // ignore: use_build_context_synchronously
        context.router.replaceNamed(RouterItem.customerLogin.str());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Colors.white,
            Color.fromARGB(31, 85, 85, 85),
          ],
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              ImageItem.splash.str(),
            ),
          ],
        ),
      ),
    );
  }
}
