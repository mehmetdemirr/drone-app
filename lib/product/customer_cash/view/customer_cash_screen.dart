import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CustomerCashScreen extends StatefulWidget {
  const CustomerCashScreen({super.key});
  @override
  State<CustomerCashScreen> createState() => _CustomerCashScreenState();
}

class _CustomerCashScreenState extends State<CustomerCashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kasam")),
      body: const Column(
        children: [
          Text("daha önce alınan siparişler | ödenmeyi bekleyen siparişler "),
        ],
      ),
    );
  }
}
