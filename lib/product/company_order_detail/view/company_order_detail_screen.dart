import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CompanyOrderDetailScreen extends StatefulWidget {
  const CompanyOrderDetailScreen({super.key});
  @override
  State<CompanyOrderDetailScreen> createState() =>
      _CompanyOrderDetailScreenState();
}

class _CompanyOrderDetailScreenState extends State<CompanyOrderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sipariş Detayı"),
      ),
      body: const Column(
        children: [
          Text("Sipariş detay"),
        ],
      ),
    );
  }
}
