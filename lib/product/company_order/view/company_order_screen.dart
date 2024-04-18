import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:demo/core/log/log.dart';
import 'package:demo/core/navigation/app_router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CompanyOrderScreen extends StatefulWidget {
  const CompanyOrderScreen({super.key});
  @override
  State<CompanyOrderScreen> createState() => _CompanyOrderScreenState();
}

class _CompanyOrderScreenState extends State<CompanyOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Siparişler"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: InkWell(
              onTap: () {
                context.router.navigateNamed(RouterItem.companyNewOrder.str());
              },
              child: Container(
                height: 35,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(82, 0, 255, 1),
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: Colors.grey, width: 2)),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.add,
                        size: 15,
                        color: Colors.white,
                      ),
                      Text(
                        "Yeni Sipariş",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Tümü",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: const Color.fromRGBO(82, 0, 255, 1),
                      ),
                ),
                Text(
                  "Bekleyen",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Colors.black38,
                      ),
                ),
                Text(
                  "Teslim Edilen",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Colors.black38,
                      ),
                ),
                //TODO iptal daha sonra eklenebilir
                // Text(
                //   "İptal",
                //   style: Theme.of(context).textTheme.titleSmall?.copyWith(
                //         color: Colors.black38,
                //       ),
                // ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Ara",
                  prefixIcon: Icon(Icons.search_outlined),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 15,
                itemBuilder: (context, index) {
                  var random = Random();
                  int rSayi = random.nextInt(2); // 0 , 1
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: InkWell(
                      onTap: () {
                        context.navigateNamedTo(
                            RouterItem.companyOrderDetail.str());
                      },
                      child: Card(
                        color: Colors.white,
                        elevation: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Mehmet Demir",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Sipariş Id:",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              color: const Color.fromRGBO(
                                                  153, 153, 153, 1),
                                            ),
                                      ),
                                      Text(
                                        " 17392  | 6 Parça",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              color: const Color.fromRGBO(
                                                  153, 153, 153, 1),
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "₺250.00",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                              color: const Color.fromRGBO(
                                                  82, 0, 255, 1),
                                            ),
                                      ),
                                      const SizedBox(width: 15),
                                      const Icon(Icons.motorcycle_outlined),
                                      Text(
                                        " | 12 Haz 2024 12.30",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              color: const Color.fromRGBO(
                                                  153, 153, 153, 1),
                                            ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Log.info("Sipariş detay");
                                      },
                                      icon: const Icon(
                                          Icons.keyboard_arrow_down_outlined),
                                    ),
                                    const SizedBox(height: 10),
                                    Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: const Color.fromRGBO(
                                                184, 184, 201, 1),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Text(
                                            rSayi == 1
                                                ? "Tamamlandı"
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
                              ),
                            ],
                          ),
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
