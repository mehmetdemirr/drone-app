import 'package:auto_route/auto_route.dart';
import 'package:demo/product/customer_basket/view/customer_basket_screen.dart';
import 'package:demo/product/customer_cash/view/customer_cash_screen.dart';
import 'package:demo/product/customer_products/view/customer_products_screen.dart';
import 'package:demo/product/customer_setting/view/customer_setting_screen.dart';
import 'package:demo/product/customer_statistic/view/customer_statistic_screen.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key});
  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  int _selectedTab = 0;

  final List _pages = [
    const CustomerStatisticScreen(),
    const CustomerProductsScreen(),
    const CustomerBasketScreen(),
    const CustomerCashScreen(),
    const CustomerSettingScreen(),
  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (index) => _changeTab(index),
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
              icon: Icon(Icons.monetization_on_outlined), label: "Kasa"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Ayarlar"),
        ],
      ),
    );
  }

  Stack _sepetIcon(BuildContext context, int sayi) {
    return Stack(
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
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Center(
                child: Text(
                  "$sayi",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
