import 'package:auto_route/auto_route.dart';
import 'package:demo/core/extension/screen_size.dart';
import 'package:demo/core/location/location_manager.dart';
import 'package:demo/core/navigation/app_router.dart';
import 'package:demo/product/customer_basket/model/customer_basket_model.dart';
import 'package:demo/product/customer_basket/viewmodel/customer_basket_viewmodel.dart';
import 'package:demo/product/general/widget/custom_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

class CustomerBasketScreen extends StatefulWidget {
  const CustomerBasketScreen({super.key});
  @override
  State<CustomerBasketScreen> createState() => _CustomerBasketScreenState();
}

class _CustomerBasketScreenState extends State<CustomerBasketScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      setState(() {
        Future.delayed(Duration.zero).then((value) async {
          context.read<CustomerBasketViewModel>().fetchBasket();
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sepetim"),
        actions: [
          IconButton(
            onPressed: () {
              context.read<CustomerBasketViewModel>().deleteBasket();
            },
            icon: const Icon(Icons.delete_outline_outlined),
          )
        ],
      ),
      body: context.watch<CustomerBasketViewModel>().isLoading
          ? const Center(child: CircularProgressIndicator.adaptive())
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: _basketListviewBuilder(
                      context
                          .watch<CustomerBasketViewModel>()
                          .basketModel
                          ?.orderItems,
                    ),
                  )
                ],
              ),
            ),
      bottomNavigationBar: context.watch<CustomerBasketViewModel>().isLoading
          ? const SizedBox()
          : _sepetOnaylaButton(
              context,
              context.watch<CustomerBasketViewModel>().basketModel,
              context.watch<CustomerBasketViewModel>().isLoadingSepetiOnayla,
            ),
    );
  }

  Container _sepetOnaylaButton(
    BuildContext context,
    CustomerBasketModel? customerBasketModel,
    bool isLoading,
  ) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () async {
              if (customerBasketModel == null) {
                EasyLoading.showError("Lütfen sepete ürün ekleyin !");
              } else {
                context
                    .read<CustomerBasketViewModel>()
                    .changeLoadingSepetiOnayla();
                LocationData? locationData =
                    await LocationManager().getLoacation();
                // ignore: use_build_context_synchronously
                context
                    .read<CustomerBasketViewModel>()
                    .changeLoadingSepetiOnayla();
                if (locationData != null) {
                  EasyLoading.showSuccess(
                      "Konum alındı : lat:${locationData.latitude}-${locationData.longitude}");
                  // ignore: use_build_context_synchronously
                  context.router.navigate(
                    CustomerOrderConfirmRoute(locationData: locationData),
                  );
                } else {
                  EasyLoading.showError("Konum alınamadı");
                }
              }
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
                  child: isLoading
                      ? const CircularProgressIndicator.adaptive()
                      : Text(
                          "Sepeti Onayla",
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Colors.black,
                                  ),
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _basketListviewBuilder(List<OrderItem>? list) {
    return list == null
        ? const Text("Sepette ürün bulunmadı ! Ürün ekleyebilirsiniz !")
        : list.isEmpty
            ? const Text("Sepette ürün bulunmadı ! Ürün ekleyebilirsiniz !")
            : ListView.builder(
                itemCount: list.length,
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
                              child: SizedBox(
                                height: 100,
                                width: 150,
                                child: CustomCachedImageWidget(
                                  imageUrl: list[index].product.imageUrl,
                                  isCircular: true,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  list[index].product.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  "${list[index].amount} adet",
                                ),
                                Text(
                                  "${int.parse(list[index].product.stockAmount) * double.parse(list[index].product.price)} TL",
                                ),
                              ],
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                context
                                    .read<CustomerBasketViewModel>()
                                    .deleteProductBasket(list[index].id);
                              },
                              icon: const Icon(Icons.delete),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
  }
}
