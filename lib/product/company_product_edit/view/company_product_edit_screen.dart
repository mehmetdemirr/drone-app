import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CompanyProductEditScreen extends StatefulWidget {
  const CompanyProductEditScreen({
    super.key,
    @PathParam('id') required this.id,
  });

  final int id;

  @override
  State<CompanyProductEditScreen> createState() =>
      _CompanyProductEditScreenState();
}

class _CompanyProductEditScreenState extends State<CompanyProductEditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ürün Düzenle")),
      body: const Column(
        children: [
          Text("Ürün bilgileri gelsin ve ürünü update et"),
        ],
      ),
    );
  }
}
