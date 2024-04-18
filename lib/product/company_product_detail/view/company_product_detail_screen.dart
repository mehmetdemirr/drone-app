import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CompanyProductDetailScreen extends StatefulWidget {
  const CompanyProductDetailScreen({
    super.key,
    @PathParam('id') required this.id,
  });
  final int id;
  @override
  State<CompanyProductDetailScreen> createState() =>
      _CompanyProductDetailScreenState();
}

class _CompanyProductDetailScreenState
    extends State<CompanyProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ürün detay")),
      body: const Column(
        children: [
          Text(
              "Ürün detaylarını göster | image , stok , açıklama, fiyat ,ağırlığı"),
        ],
      ),
    );
  }
}
