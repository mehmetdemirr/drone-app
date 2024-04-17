import 'package:auto_route/auto_route.dart';
import 'package:demo/core/extension/screen_size.dart';
import 'package:demo/core/navigation/app_router.dart';
import 'package:demo/core/utilty/images_items.dart';
import 'package:demo/product/customer_basket/view/customer_basket_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

@RoutePage()
class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key});
  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _currentPage = 0;
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  bool musteriIcerdeMi = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentPage == 0 ? "Ana Sayfa" : "Sepet"),
        leading: _currentPage == 1
            ? IconButton(
                onPressed: () {
                  _pageController.jumpToPage(0);
                },
                icon: const Icon(
                  Icons.arrow_back,
                ))
            : const SizedBox(),
        actions: [
          _currentPage == 0
              ? IconButton(
                  onPressed: () {
                    _pageController.jumpToPage(1);
                  },
                  icon: Stack(
                    children: [
                      const SizedBox(
                        height: 50,
                        width: 40,
                        child: Icon(
                          Icons.shopping_cart_outlined,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: const BoxDecoration(
                              color: Colors.red,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Center(
                              child: Text(
                                "11",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
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
                )
              : const SizedBox(),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        children: [
          homeScreen(context),
          const CustomerBasketScreen(),
        ],
      ),
    );
  }

  Widget homeScreen(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.navigateNamedTo(RouterItem.qr.str());
                },
                child: const Text("Tesise giriş yap"),
              ),
              ElevatedButton(
                onPressed: () {
                  context.navigateNamedTo(RouterItem.qr.str());
                },
                child: const Text("Tesisten çıkış yap"),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              //tüm routları temizle sadece customer ana sayfa kalsın
              context.router.replaceAll(
                [
                  const SplashRoute(),
                ],
              );
            },
            child: const Text("çıkış yap"),
          ),
          Switch.adaptive(
            value: musteriIcerdeMi,
            onChanged: (value) {
              setState(() {
                musteriIcerdeMi = !musteriIcerdeMi;
              });
            },
          ),
          !musteriIcerdeMi
              ? const Column(
                  children: [
                    Text("Müşteri tesiste değil !"),
                  ],
                )
              : Column(
                  children: [
                    const Text("Müşteri şuan tesiste bulunuyor !"),
                    SizedBox(
                      height: context.height * .68,
                      child: GridView.builder(
                          itemCount: 15,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(10)),
                                                border: Border.all(
                                                    color: Colors.grey,
                                                    width: 2)),
                                            child: Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
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
                    )
                  ],
                )
        ],
      ),
    );
  }
}
