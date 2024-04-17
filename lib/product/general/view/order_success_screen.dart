import 'package:auto_route/auto_route.dart';
import 'package:demo/core/extension/screen_size.dart';
import 'package:demo/core/navigation/app_router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OrderSuccessScreen extends StatefulWidget {
  const OrderSuccessScreen({super.key});
  @override
  State<OrderSuccessScreen> createState() => _OrderSuccessScreenState();
}

class _OrderSuccessScreenState extends State<OrderSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.check,
              size: 60,
            ),
            const Text("İşlem Başarılı"),
            const SizedBox(height: 10),
            SizedBox(
              width: context.width / 1.5,
              child: const Center(
                child: Text(
                    textAlign: TextAlign.center,
                    "İşlem tamamladı.Sipariş alındığında bilgilendirme yapılacaktır"),
              ),
            ),
            TextButton(
              onPressed: () {
                //tüm routları temizle sadece customer ana sayfa kalsın
                context.router.replaceAll(
                  [
                    const CustomerHomeRoute(),
                  ],
                );
              },
              child: const Text("Ana Sayfaya Dön"),
            ),
          ],
        ),
      ),
    );
  }
}
