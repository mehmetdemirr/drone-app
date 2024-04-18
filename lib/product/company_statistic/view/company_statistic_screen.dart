import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CompanyStatisticScreen extends StatefulWidget {
  const CompanyStatisticScreen({super.key});
  @override
  State<CompanyStatisticScreen> createState() => _CompanyStatisticScreenState();
}

class _CompanyStatisticScreenState extends State<CompanyStatisticScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("İstatistiklerim")),
      body: const Column(
        children: [
          Text("İstatistik"),
        ],
      ),
    );
  }
}
