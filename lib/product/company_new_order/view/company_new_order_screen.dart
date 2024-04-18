import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CompanyNewOrderScreen extends StatefulWidget {
  const CompanyNewOrderScreen({super.key});
  @override
  State<CompanyNewOrderScreen> createState() => _CompanyNewOrderScreenState();
}

class _CompanyNewOrderScreenState extends State<CompanyNewOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Yeni Sipariş")),
      body: const Column(
        children: [
          Text("Sipariş oluştur"),
        ],
      ),
    );
  }
}
