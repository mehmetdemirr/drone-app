import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CompanyProductsScreen extends StatefulWidget {
  const CompanyProductsScreen({super.key});
  @override
  State<CompanyProductsScreen> createState() => _CompanyProductsScreenState();
}

class _CompanyProductsScreenState extends State<CompanyProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ürünlerim")),
      body: const Column(
        children: [
          Text("ürünler | ürün ekle vs "),
        ],
      ),
    );
  }
}
