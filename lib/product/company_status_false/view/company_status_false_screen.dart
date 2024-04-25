import 'package:auto_route/auto_route.dart';
import 'package:demo/core/cache/shared_pref.dart';
import 'package:demo/core/navigation/app_router.dart';
import 'package:demo/product/company_home/model/company_info_model.dart';
import 'package:demo/product/company_home/service/company_info_service.dart';
import 'package:demo/product/general/model/base_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

@RoutePage()
class CompanyStatusFalseScreen extends StatefulWidget {
  const CompanyStatusFalseScreen({super.key});
  @override
  State<CompanyStatusFalseScreen> createState() =>
      _CompanyStatusFalseScreenState();
}

class _CompanyStatusFalseScreenState extends State<CompanyStatusFalseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Onay Bekliyor"),
        actions: [
          IconButton(
            onPressed: () async {
              await SharedPref().clearAll().then((value) {
                //tüm routları temizle sadece splash kalsın
                context.router.replaceAll(
                  [
                    const SplashRoute(),
                  ],
                );
              });
            },
            icon: const Icon(Icons.logout_outlined),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                const Icon(
                  Icons.error,
                  size: 100,
                ),
                Text(
                  textAlign: TextAlign.center,
                  "Lütfen bizimle iletişime geçin.\nHesabınızın onaya ihtiyacı var.\ndogukantuncay1@gmail.com",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                ElevatedButton(
                  onPressed: () async {
                    BaseResponse<CompanyInfoModel?> companyInfo =
                        await CompanyInfoService().companyInfo();
                    if (companyInfo.data?.status == "1") {
                      EasyLoading.showSuccess("Giriş başarılı");
                      //tüm routları temizle sadece company home kalsın
                      // ignore: use_build_context_synchronously
                      context.router.replaceAll(
                        [
                          const CompanyHomeRoute(),
                        ],
                      );
                    } else if (companyInfo.data?.status == "0") {
                      //hala onaylanmamış
                      EasyLoading.showError(
                          "Hesabınızın onaya ihtiyacı var.Lütfen iletişime geçin !");
                    }
                  },
                  child: const Text("Yenile"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
