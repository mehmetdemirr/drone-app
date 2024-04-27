import 'package:auto_route/auto_route.dart';
import 'package:demo/core/extension/screen_size.dart';
import 'package:demo/core/utilty/images_items.dart';
import 'package:demo/product/general/grafikler/radial_gauge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

@RoutePage()
class CustomerStatisticScreen extends StatefulWidget {
  const CustomerStatisticScreen({super.key});
  @override
  State<CustomerStatisticScreen> createState() =>
      _CustomerStatisticScreenState();
}

class _CustomerStatisticScreenState extends State<CustomerStatisticScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ana Sayfa"),
        actions: [
          IconButton(
            onPressed: () {
              EasyLoading.showInfo("Yakında ...");
            },
            icon: const Icon(Icons.notifications_active_outlined),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Her zaman daha iyiyi",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 36,
                  ),
            ),
            Text(
              "Hedefle",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 36,
                    color: const Color.fromRGBO(82, 0, 255, 1),
                  ),
            ),
            // const Expanded(child: PieChartWidget()),
            // SizedBox(
            //   height: context.height / 3,
            //   child: const SplineAreaChartWidget(),
            // ),
            const SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: context.width / 3,
                child: const RadialGauge(
                  progressValue: 75.55,
                  progressValueChange: 75.55,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Tesiste En Çok Satan Ürünler",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: context.width / 6,
                              height: context.width / 6,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Köşe yuvarlama
                                border: Border.all(
                                  color: Colors.black, // Sınır rengi
                                  width: 2.0, // Sınır kalınlığı
                                ),
                              ),
                              child: ClipRRect(
                                // Köşe yuvarlama için ClipRRect kullanıyoruz
                                borderRadius: BorderRadius.circular(
                                    8.0), // İçerideki border radius değeriyle uyumlu olacak şekilde ayarlayın
                                child: Image.asset(
                                  ImageItem.appIcon.str(),
                                  fit: BoxFit
                                      .contain, // Görüntüyü tamamen içerecek şekilde boyutlandır
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Su",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        fontSize: 14,
                                      ),
                                ),
                                Text(
                                  "112 adet",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                EasyLoading.showInfo("Yakında geliyor...");
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    color: Color.fromRGBO(82, 0, 255, 1),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "İncele",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            color: Colors.white,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
