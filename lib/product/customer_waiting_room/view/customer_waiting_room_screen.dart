import 'package:auto_route/auto_route.dart';
import 'package:demo/core/cache/shared_pref.dart';
import 'package:demo/core/navigation/app_router.dart';
import 'package:demo/product/customer_home/model/customer_info_model.dart';
import 'package:demo/product/customer_home/service/customer_info_service.dart';
import 'package:demo/product/general/model/base_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

@RoutePage()
class CustomerWaitingRoomScreen extends StatefulWidget {
  const CustomerWaitingRoomScreen({super.key});
  @override
  State<CustomerWaitingRoomScreen> createState() =>
      _CustomerWaitingRoomScreenState();
}

class _CustomerWaitingRoomScreenState extends State<CustomerWaitingRoomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bekleme Odası"),
        actions: [
          IconButton(
            onPressed: () async {
              if (true) {
                EasyLoading.showSuccess("Tesisten Çıkış Başarılı !");
                await SharedPref().clearAll().then((value) {
                  //tüm routları temizle sadece splash kalsın
                  context.router.replaceAll(
                    [
                      const SplashRoute(),
                    ],
                  );
                });
              }
              //TODO bu kullanılacak
              // BaseResponse response =
              //     await CustomerCompanyService().userLogoutCompany();
              // if (response.succeeded) {
              //   EasyLoading.showSuccess("Tesisten Çıkış Başarılı !");
              //   await SharedPref().clearAll().then((value) {
              //     //tüm routları temizle sadece splash kalsın
              //     context.router.replaceAll(
              //       [
              //         const SplashRoute(),
              //       ],
              //     );
              //   });
              // } else {
              //   EasyLoading.showError(
              //       "Tesisten Çıkış Başarısız.Error:${response.errors}-${response.message}");
              // }
            },
            icon: const Icon(Icons.logout_outlined),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              "Şirketin sizi onaylaması için bekliyorsunuz.\nŞirket onayladıktan sonra uygulamayı tekrar açabilirsiniz !",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            ElevatedButton(
              onPressed: () async {
                // String? companyToken = await SharedPref().getCompanyToken();
                // String? customerToken = await SharedPref().getCustomerToken();
                // int? companyId = await SharedPref().getCompanyId();
                BaseResponse<CustomerInfoModel?> userInfo =
                    await CustomerInfoService().customerInfo();
                if (userInfo.data?.activeCompany == "true") {
                  EasyLoading.showSuccess("Giriş başarılı !");
                  //tüm routları temizle sadece customer ana sayfa kalsın
                  // ignore: use_build_context_synchronously
                  context.router.replaceAll(
                    [
                      const CustomerHomeRoute(),
                    ],
                  );
                } else if (userInfo.data?.activeCompany == "waiting") {
                  EasyLoading.showError(
                      "Tesis hala onaylamamış !\nTesis ile iletişime geçebilirsiniz !");
                } else if (userInfo.data?.activeCompany == "false") {
                  //tüm routları temizle sadece customer ana sayfa kalsın
                  // ignore: use_build_context_synchronously
                  context.router.replaceAll(
                    [
                      const CustomerAreaLoginRoute(),
                    ],
                  );
                }
              },
              child: const Text("Yenile"),
            ),
          ],
        ),
      ),
    );
  }
}
