import 'package:auto_route/auto_route.dart';
import 'package:demo/core/function/show_dialog.dart';
import 'package:demo/product/customer_basket/view/customer_basket_screen.dart';
import 'package:demo/product/customer_cash/view/customer_cash_screen.dart';
import 'package:demo/product/customer_home/viewmodel/customer_home_viewmodel.dart';
import 'package:demo/product/customer_products/view/customer_products_screen.dart';
import 'package:demo/product/customer_setting/view/customer_setting_screen.dart';
import 'package:demo/product/customer_statistic/view/customer_statistic_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

@RoutePage()
class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key});
  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  final List _pages = [
    const CustomerStatisticScreen(),
    const CustomerProductsScreen(),
    const CustomerBasketScreen(),
    const CustomerCashScreen(),
    const CustomerSettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) async {
          customShowAlertDialog(
            context: context,
            title: const Text("Çıkış"),
            text: const Text("Golfrone'dan çıkmak istiyor musunuz ?"),
            no: TextButton(
              onPressed: () {
                context.router.pop();
              },
              child: const Text("Hayır"),
            ),
            yes: TextButton(
              onPressed: () {
                SystemNavigator.pop();
              },
              child: const Text("Evet"),
            ),
          );
        },
        child: _pages[context.watch<CustomerHomeViewModel>().selectedTab],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: context.watch<CustomerHomeViewModel>().selectedTab,
        onTap: (index) =>
            context.read<CustomerHomeViewModel>().changeTab(index),
        selectedItemColor: const Color.fromRGBO(82, 0, 255, 1),
        unselectedItemColor: Colors.grey,
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.home), label: "Ana Sayfam"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.inventory_2_outlined), label: "Ürünler"),
          BottomNavigationBarItem(
              icon: _sepetIcon(context, 11), label: "Sepetim"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.update_outlined), label: "Geçmiş"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Ayarlar"),
        ],
      ),
    );
  }

  Stack _sepetIcon(BuildContext context, int sayi) {
    return const Stack(
      children: [
        SizedBox(
          height: 50,
          width: 40,
          child: Icon(
            Icons.shopping_cart_outlined,
          ),
        ),
        // Positioned(
        //   top: 0,
        //   right: 0,
        //   child: Container(
        //     width: 20,
        //     height: 20,
        //     decoration: const BoxDecoration(
        //         color: Colors.red,
        //         borderRadius: BorderRadius.all(Radius.circular(10))),
        //     child: Padding(
        //       padding: const EdgeInsets.all(1.0),
        //       child: Center(
        //         child: Text(
        //           "$sayi",
        //           style: Theme.of(context).textTheme.bodySmall?.copyWith(
        //                 color: Colors.white,
        //               ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
