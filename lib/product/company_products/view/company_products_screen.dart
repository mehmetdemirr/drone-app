import 'package:auto_route/auto_route.dart';
import 'package:demo/core/extension/screen_size.dart';
import 'package:demo/core/navigation/app_router.dart';
import 'package:demo/product/company_products/model/get_all_product_model.dart';
import 'package:demo/product/company_products/viewmodel/company_products_viewmodel.dart';
import 'package:demo/product/general/widget/custom_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class CompanyProductsScreen extends StatefulWidget {
  const CompanyProductsScreen({super.key});
  @override
  State<CompanyProductsScreen> createState() => _CompanyProductsScreenState();
}

class _CompanyProductsScreenState extends State<CompanyProductsScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      setState(() {
        Future.delayed(Duration.zero).then((value) async {
          context.read<CompanyProductViewModel>().productListFetch();
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Ürünlerim"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: InkWell(
              onTap: () {
                context.router
                    .navigateNamed(RouterItem.companyNewProduct.str());
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
                        "Yeni Ürün",
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
      body: context.watch<CompanyProductViewModel>().isLoading
          ? const Center(child: CircularProgressIndicator.adaptive())
          : Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _gridviewBuilderProduct(
                        context.watch<CompanyProductViewModel>().productList),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _gridviewBuilderProduct(List<CompanyProductModel>? list) {
    return list == null
        ? const Text("ürünler yüklenemedi !")
        : list.isEmpty
            ? const Text("Ürün listeniz boş !")
            : GridView.builder(
                itemCount: list.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.8),
                itemBuilder: (context, index) {
                  double cardWidth = context.width / 2 - 10;
                  return InkWell(
                    onTap: () {
                      context.navigateTo(
                        CompanyProductDetailRoute(id: list[index].id),
                      );
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
                              SizedBox(
                                width: cardWidth,
                                height: 125,
                                child: CustomCachedImageWidget(
                                    imageUrl: list[index].imageUrl ?? "-"),
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
                                onTap: () {
                                  context.navigateTo(
                                      CompanyProductEditRoute(id: 1));
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
                                        "Düzenle",
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
                });
  }
}
