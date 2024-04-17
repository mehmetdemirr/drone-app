import 'package:demo/core/cache/shared_pref.dart';
import 'package:demo/core/navigation/app_router.dart';
import 'package:demo/core/network_control/no_network_widget.dart';
import 'package:demo/core/theme/dark_theme.dart';
import 'package:demo/core/theme/light_theme.dart';
import 'package:demo/core/theme/theme_view_model.dart';
import 'package:demo/product/home_screen/home_view_model.dart';
import 'package:demo/product/network_work_screen/viewmodel/post_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  var darkModeOn = await SharedPref().getTheme();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeNotifier>(
          create: (_) => ThemeNotifier(darkModeOn ? darkTheme : lightTheme),
        ),
        ChangeNotifierProvider<HomeViewModel>(
          create: (_) => HomeViewModel(),
        ),
        ChangeNotifierProvider<PostViewModel>(
          create: (_) => PostViewModel(),
        ),
      ],
      child: EasyLocalization(
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('tr', 'TR'),
        ],
        path:
            'assets/translations', // <-- change the path of the translation files
        fallbackLocale: const Locale('tr', 'TR'),
        saveLocale: true,
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      //local language change example: date picker , time picker
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.deviceLocale,

      debugShowCheckedModeBanner: false,
      title: 'Drone App',
      //theme
      theme: context.watch<ThemeNotifier>().getTheme() ? darkTheme : lightTheme,
      //router
      routerConfig: _appRouter.config(),
      //network control
      builder: EasyLoading.init(
        builder: (context, child) {
          return Column(
            children: [
              Expanded(
                child: child ?? const SizedBox(),
              ),
              const NoNetworkWidget(),
              // tasarımlar yapılan bu kaldırabilir. 5 height kayma olabilir
              // context.small
              //     ? Container(
              //         color: Colors.green,
              //         width: context.width,
              //         height: 5,
              //       )
              //     : context.medium
              //         ? Container(
              //             color: Colors.blue,
              //             width: context.width,
              //             height: 5,
              //           )
              //         : Container(
              //             color: Colors.red,
              //             width: context.width,
              //             height: 5,
              //           )
            ],
          );
        },
      ),
    );
  }
}
