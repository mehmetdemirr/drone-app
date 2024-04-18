import 'package:auto_route/auto_route.dart';
import 'package:demo/core/extension/screen_size.dart';
import 'package:demo/core/navigation/app_router.dart';
import 'package:demo/product/qr_screen/view/qr_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

@RoutePage()
class CustomerAreaLoginScreen extends StatefulWidget {
  const CustomerAreaLoginScreen({super.key});
  @override
  State<CustomerAreaLoginScreen> createState() =>
      _CustomerAreaLoginScreenState();
}

class _CustomerAreaLoginScreenState extends State<CustomerAreaLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(82, 0, 255, 1),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Text(
                "Qr Kodu Tarayın",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 5),
              Text(
                textAlign: TextAlign.center,
                "işletme girişindeki Qr kodu cihazınız ile tarayıp işletmeye girdiğinizi doğrulayın",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 300,
                width: context.width * 0.85,
                child: const QRViewExampleScreen(),
              ),
              Text(
                "Okuduktan sonra otomatik işletmeye giriş yapacak \n Not: Giriş yapmışsa bu sayfa gözükmeyecek !",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white,
                    ),
              ),
              ElevatedButton(
                onPressed: () {
                  EasyLoading.showSuccess("Giriş başarılı");
                  //tüm routları temizle sadece customer ana sayfa kalsın
                  context.router.replaceAll(
                    [
                      const CustomerHomeRoute(),
                    ],
                  );
                },
                child: const Text("Tesise giriş yap(şimdilik)"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
