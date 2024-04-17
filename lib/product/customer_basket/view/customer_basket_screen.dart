import 'package:auto_route/auto_route.dart';
import 'package:demo/core/extension/screen_size.dart';
import 'package:demo/core/navigation/app_router.dart';
import 'package:demo/core/utilty/images_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CustomerBasketScreen extends StatefulWidget {
  const CustomerBasketScreen({super.key});
  @override
  State<CustomerBasketScreen> createState() => _CustomerBasketScreenState();
}

class _CustomerBasketScreenState extends State<CustomerBasketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: SizedBox(
                      height: 150,
                      child: Card(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(ImageItem.demoProduct.str()),
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Su",
                                ),
                                Text(
                                  "Açıklma vs.......",
                                ),
                                Text(
                                  "12,23 TL",
                                ),
                              ],
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                EasyLoading.showSuccess("Sepetten silindi");
                              },
                              icon: const Icon(Icons.delete),
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Container(
          height: 50,
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  context.router
                      .navigateNamed(RouterItem.customerOrderConfirm.str());
                },
                child: Container(
                  width: context.width / 2,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.grey, width: 2)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "Sepeti Onayla",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Colors.black,
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
  }
}
