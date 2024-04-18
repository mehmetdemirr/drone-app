import 'package:auto_route/auto_route.dart';
import 'package:demo/core/extension/screen_size.dart';
import 'package:demo/core/navigation/app_router.dart';
import 'package:demo/core/utilty/images_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CustomerProductsScreen extends StatefulWidget {
  const CustomerProductsScreen({super.key});
  @override
  State<CustomerProductsScreen> createState() => _CustomerProductsScreenState();
}

class _CustomerProductsScreenState extends State<CustomerProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ürünler"),
      ),
      body: Column(
        children: [
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
            child: GridView.builder(
                itemCount: 15,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.8),
                itemBuilder: (context, index) {
                  double cardWidth = context.width / 2 - 10;
                  return InkWell(
                    onTap: () {
                      context.navigateTo(ProductDetailRoute(id: 1));
                    },
                    child: SizedBox(
                      height: context.height / 2,
                      child: Card(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                width: cardWidth,
                                height: 125,
                                ImageItem.demoProduct.str(),
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Su",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      color: Colors.grey.shade700,
                                    ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "10,34",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          color: Colors.black,
                                        ),
                                  ),
                                  Text(
                                    " TL",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          color: Colors.black,
                                        ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  EasyLoading.showSuccess(
                                      "Ürün sepete eklendi");
                                },
                                child: Container(
                                  width: cardWidth,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      border: Border.all(
                                          color: Colors.grey, width: 2)),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        "Sepete ekle",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
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
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
