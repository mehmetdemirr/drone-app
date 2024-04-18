import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:demo/core/navigation/app_router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CompanyCashScreen extends StatefulWidget {
  const CompanyCashScreen({super.key});
  @override
  State<CompanyCashScreen> createState() => _CompanyCashScreenState();
}

class _CompanyCashScreenState extends State<CompanyCashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kasam"),
      ),
      body: Column(
        children: [
          const Text(
              "Ödeme alınacak Siparişler | Ödenmiş tutarlar | en üstte toplamı yazacak"),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Text(
              "Bekleyen Ödemeler",
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: const Color.fromRGBO(82, 0, 255, 1),
                  ),
            ),
            Text(
              "Tüm Ödemeler",
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Colors.black38,
                  ),
            ),
          ]),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                var random = Random();
                int rSayi = random.nextInt(2); // 0 , 1
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      context.navigateTo(CompanyCashEditRoute(id: 1));
                    },
                    child: Card(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Column(
                                  children: [
                                    Text("Mehmet Demir"),
                                    Text("Toplam : 200TL")
                                  ],
                                ),
                                const Spacer(),
                                Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color.fromRGBO(
                                            184, 184, 201, 1),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Text(
                                        rSayi == 1
                                            ? "Ödeme Alındı"
                                            : "Bekliyor",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                              color: rSayi == 1
                                                  ? const Color.fromRGBO(
                                                      0, 194, 13, 1)
                                                  : const Color.fromRGBO(
                                                      233, 181, 47, 1),
                                            ),
                                      ),
                                    )
                                    //todo container yerine ikonda koyabiliriz
                                    // Icon(rSayi == 1
                                    //     ? Icons.check_circle_outline_outlined
                                    //     : Icons.cached_outlined),
                                    ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
