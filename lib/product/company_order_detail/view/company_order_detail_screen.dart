import 'package:auto_route/auto_route.dart';
import 'package:demo/core/extension/screen_size.dart';
import 'package:demo/core/log/log.dart';
import 'package:demo/core/url_launcher/url_launher_func.dart';
import 'package:demo/product/company_order_detail/widget/map_screen_example.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

@RoutePage()
class CompanyOrderDetailScreen extends StatefulWidget {
  const CompanyOrderDetailScreen({super.key});
  @override
  State<CompanyOrderDetailScreen> createState() =>
      _CompanyOrderDetailScreenState();
}

class _CompanyOrderDetailScreenState extends State<CompanyOrderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sipariş Detayı"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Sipariş detay"),
            const Text("sipariş id : 232434 | 260.32 TL"),
            Container(
              height: 400,
              width: context.width,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
              ),
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return const Card(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("su "),
                            Spacer(),
                            Text("30.34 TL"),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const Column(
              children: [
                Text(
                  "Kdv  : 293.34 TL",
                ),
                Text(
                  "Ara Toplam  : 293.34 TL",
                ),
                Text(
                  "Toplam Tutar : 293.34 TL",
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Center(child: Text("Konum ")),
            Center(
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        await CustomUrlLauncher.openMap(context, 30, 20);
                      } catch (e) {
                        Log.error(
                            "company order detail screen harita yönlendirme hatası");
                        EasyLoading.showError(
                            "Yönlendirme yapılamadı!\nLütfen tekrar deneyiniz.");
                      }
                    },
                    child: const Text("Konuma Git"),
                  ),
                  const SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        EasyLoading.showSuccess(
                            "Konum paylaşılacak (share plus)");
                      } catch (e) {
                        Log.error(
                            "company order detail screen konum paylaşma hatası");
                        EasyLoading.showError(
                            "Konum paylaşma yapılamadı!\nLütfen tekrar deneyiniz.");
                      }
                    },
                    child: const Text("Konuma paylaş"),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 500,
              child: FlutterMapExample(),
            ),
          ],
        ),
      ),
    );
  }
}
