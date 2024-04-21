import 'package:auto_route/auto_route.dart';
import 'package:demo/core/extension/string_extension.dart';
import 'package:demo/core/navigation/app_router.dart';
import 'package:demo/core/theme/dark_theme.dart';
import 'package:demo/core/theme/light_theme.dart';
import 'package:demo/core/theme/theme_view_model.dart';
import 'package:demo/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class CustomerSettingScreen extends StatefulWidget {
  const CustomerSettingScreen({super.key});
  @override
  State<CustomerSettingScreen> createState() => _CustomerSettingScreenState();
}

class _CustomerSettingScreenState extends State<CustomerSettingScreen> {
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
            Row(
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
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  "Dil Seçenekleri",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Spacer(),
                const Text("Otomatik Cihaz dili yaptım"),
              ],
            ),
            Text(
              LocaleKeys.hello.locale,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                //TODO çıkış işlemlerini yap cache temizle //temayı- dil default yap
                //tüm routları temizle sadece splash kalsın
                context.router.replaceAll(
                  [
                    const SplashRoute(),
                  ],
                );
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
