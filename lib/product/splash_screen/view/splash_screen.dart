import 'package:auto_route/auto_route.dart';
import 'package:demo/core/navigation/app_router.dart';
import 'package:demo/core/utilty/images_items.dart';
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
    Future.delayed(const Duration(seconds: 2)).then((value) {
      context.router.replaceNamed(RouterItem.customerLogin.str());
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
          const Text("Splash Screen"),
        ],
      ),
    );
  }
}
