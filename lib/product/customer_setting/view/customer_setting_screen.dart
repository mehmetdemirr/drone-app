import 'package:auto_route/auto_route.dart';
import 'package:demo/core/cache/shared_pref.dart';
import 'package:demo/core/extension/screen_size.dart';
import 'package:demo/core/navigation/app_router.dart';
import 'package:demo/core/theme/dark_theme.dart';
import 'package:demo/core/theme/light_theme.dart';
import 'package:demo/core/theme/theme_view_model.dart';
import 'package:demo/core/utilty/images_items.dart';
import 'package:demo/product/customer_home/model/customer_info_model.dart';
import 'package:demo/product/customer_setting/service/customer_setting_service.dart';
import 'package:demo/product/customer_setting/viewmodel/customer_setting_viewmodel.dart';
import 'package:demo/product/general/model/base_response.dart';
import 'package:demo/product/general/widget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

@RoutePage()
class CustomerSettingScreen extends StatefulWidget {
  const CustomerSettingScreen({super.key});
  @override
  State<CustomerSettingScreen> createState() => _CustomerSettingScreenState();
}

class _CustomerSettingScreenState extends State<CustomerSettingScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      setState(() {
        Future.delayed(Duration.zero).then((value) async {
          context.read<CustomerSettingViewModel>().fetchUserInfo();
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ayarlar"),
      ),
      body: context.watch<CustomerSettingViewModel>().isLoading
          ? const Center(
              child: LoadingWidget(),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: context.width / 6,
                    backgroundImage: AssetImage(ImageItem.appIcon.str()),
                  ),
                  _userNameText(context
                      .read<CustomerSettingViewModel>()
                      .customerInfoModel),
                  Card(
                    child: SizedBox(
                      width: context.width,
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              "Tema Değiştir",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const Spacer(),
                            _switchTheme(context,
                                context.watch<ThemeNotifier>().getTheme()),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: SizedBox(
                      width: context.width,
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              "Dil Seçenekleri",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const Spacer(),
                            // const Text("Gelecek..."),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.navigateNamedTo(RouterItem.companyFeedBack.str());
                    },
                    child: Card(
                      child: SizedBox(
                        width: context.width,
                        height: 60,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                "Geri Bildirim",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const Spacer(),
                              const Icon(Icons.arrow_forward),
                              const SizedBox(
                                width: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      EasyLoading.showInfo("Yakında geliyor...");
                    },
                    child: Card(
                      child: SizedBox(
                        width: context.width,
                        height: 60,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                "Profilini Düzenle",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const Spacer(),
                              const Icon(Icons.arrow_forward),
                              const SizedBox(
                                width: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () async {
                      BaseResponse response =
                          await CustomerSettingService().customerLogout();
                      if (response.succeeded) {
                        EasyLoading.showSuccess("Çıkış başarılı");
                        await SharedPref().clearAll().then((value) {
                          //tüm routları temizle sadece splash kalsın
                          context.router.replaceAll(
                            [
                              const SplashRoute(),
                            ],
                          );
                        });
                      } else {
                        EasyLoading.showError(
                            "Çıkış yapılamadı!\nLütfen tekrar deneyiniz");
                      }
                    },
                    child: Text(
                      "Çıkış Yap",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: Colors.red,
                          ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Text _userNameText(CustomerInfoModel? customerInfoModel) {
    return Text(
      "${customerInfoModel?.user.name} ${customerInfoModel?.user.surname}",
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Colors.black54,
            fontStyle: FontStyle.italic,
          ),
    );
  }

  Switch _switchTheme(BuildContext context, bool result) {
    return Switch(
      value: result,
      onChanged: (value) {
        context.read<ThemeNotifier>().setTheme(value ? darkTheme : lightTheme);
      },
    );
  }
}
