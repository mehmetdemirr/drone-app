import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CompanyNewProductScreen extends StatefulWidget {
  const CompanyNewProductScreen({super.key});
  @override
  State<CompanyNewProductScreen> createState() =>
      _CompanyNewProductScreenState();
}

class _CompanyNewProductScreenState extends State<CompanyNewProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Yeni Ürün Ekle")),
      body: const Column(
        children: [
          Text("ürün ekle"),
        ],
      ),
    );
  }
}
