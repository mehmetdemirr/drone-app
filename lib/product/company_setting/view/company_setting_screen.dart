import 'package:auto_route/auto_route.dart';
import 'package:demo/core/cache/shared_pref.dart';
import 'package:demo/core/extension/screen_size.dart';
import 'package:demo/core/navigation/app_router.dart';
import 'package:demo/core/theme/dark_theme.dart';
import 'package:demo/core/theme/light_theme.dart';
import 'package:demo/core/theme/theme_view_model.dart';
import 'package:demo/core/utilty/images_items.dart';
import 'package:demo/product/company_setting/service/company_setting_service.dart';
import 'package:demo/product/general/model/base_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

@RoutePage()
class CompanySettingScreen extends StatefulWidget {
  const CompanySettingScreen({super.key});
  @override
  State<CompanySettingScreen> createState() => _CompanySettingScreenState();
}

class _CompanySettingScreenState extends State<CompanySettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ayarlar"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: context.width / 6,
              backgroundImage: AssetImage(ImageItem.appIcon.str()),
            ),
            Text(
              "username",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.black54,
                    fontStyle: FontStyle.italic,
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
                        "Tema Değiştir",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const Spacer(),
                      _switchTheme(
                          context, context.watch<ThemeNotifier>().getTheme()),
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
                context.navigateNamedTo(RouterItem.companyNewArea.str());
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
                          "Şirket Alan Ekle",
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
                    await CompanySettingService().companyLogout();
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
                  EasyLoading.showError("Çıkış yapılamadı !\nTekrar deneyiniz");
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

  Switch _switchTheme(BuildContext context, bool result) {
    return Switch(
      value: result,
      onChanged: (value) {
        context.read<ThemeNotifier>().setTheme(value ? darkTheme : lightTheme);
      },
    );
  }
}
