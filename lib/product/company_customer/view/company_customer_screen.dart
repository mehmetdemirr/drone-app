import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CompanyCustomerScreen extends StatefulWidget {
  const CompanyCustomerScreen({super.key});
  @override
  State<CompanyCustomerScreen> createState() => _CompanyCustomerScreenState();
}

class _CompanyCustomerScreenState extends State<CompanyCustomerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Müşterilerim"),
      ),
      body: const Column(
        children: [
          Text(""),
        ],
      ),
    );
  }
}
