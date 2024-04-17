import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:demo/core/log/log.dart';
import 'package:demo/core/navigation/app_router.dart';
import 'package:demo/product/company_order/view/company_order_screen.dart';
import 'package:demo/product/company_setting/view/company_setting_screen.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CompanyHomeScreen extends StatefulWidget {
  const CompanyHomeScreen({super.key});
  @override
  State<CompanyHomeScreen> createState() => _CompanyHomeScreenState();
}

class _CompanyHomeScreenState extends State<CompanyHomeScreen> {
  int _selectedTab = 0;

  final List _pages = [
    const CompanyOrderScreen(),
    const Center(
      child: Text("İstatistik"),
    ),
    const Center(
      child: Text("Ürünler"),
    ),
    const Center(
      child: Text("Kasa"),
    ),
    const CompanySettingScreen(),
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
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: "Ana Sayfa"),
          BottomNavigationBarItem(
              icon: Icon(Icons.trending_up_outlined), label: "İstatistik"),
          BottomNavigationBarItem(
              icon: Icon(Icons.inventory_2_outlined), label: "Ürünler"),
          BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on_outlined), label: "Kasa"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Ayarlar"),
        ],
      ),
    );
  }
}
