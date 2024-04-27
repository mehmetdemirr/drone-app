import 'package:demo/core/extension/screen_size.dart';
import 'package:demo/product/customer_basket/service/customer_basket_service.dart';
import 'package:demo/product/customer_products/model/customer_product_model.dart';
import 'package:demo/product/customer_products/viewmodel/customer_product_viewmodel.dart';
import 'package:demo/product/general/model/base_response.dart';
import 'package:demo/product/general/widget/custom_cached_image.dart';
import 'package:demo/product/general/widget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

class CustomerProductsScreen extends StatefulWidget {
  const CustomerProductsScreen({super.key});
  @override
  State<CustomerProductsScreen> createState() => _CustomerProductsScreenState();
}

class _CustomerProductsScreenState extends State<CustomerProductsScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      setState(() {
        Future.delayed(Duration.zero).then((value) async {
          context.read<CustomerProductViewModel>().productListFetch();
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ürünler"),
      ),
      body: context.watch<CustomerProductViewModel>().isLoading
          ? const Center(
              child: LoadingWidget(),
            )
          : Column(
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _customProductList(
                        context.watch<CustomerProductViewModel>().productList),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _customProductList(List<CustomerProductModel>? list) {
    return list == null
        ? const Text("Ürün bulunamadı !")
        : list.isEmpty
            ? const Text("Ürün bulunamadı !")
            : GridView.builder(
                itemCount: list.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.8),
                itemBuilder: (context, index) {
                  double cardWidth = context.width / 2 - 10;
                  return InkWell(
                    onTap: () {
                      EasyLoading.showInfo(
                          "Yakında ürün detayı inceleme geliyor...");
                      // context.navigateTo(CustomerProductDetailRoute(id: 1));
                    },
                    child: Card(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: cardWidth,
                              height: 115,
                              child: CustomCachedImageWidget(
                                imageUrl: list[index].imageUrl ?? "-",
                                isCircular: true,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              list[index].title,
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
                                  list[index].price,
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
                              onTap: () async {
                                BaseResponse response =
                                    await CustomerBasketService()
                                        .addProductBasket(list[index].id);
                                if (response.succeeded) {
                                  EasyLoading.showSuccess(
                                      "Ürün sepete eklendi");
                                } else {
                                  EasyLoading.showError(
                                      "Ürün sepete eklenemedi.Error:${response.errors}-${response.message}");
                                }
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
                  );
                });
  }
}
