import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CustomerRegisterScreen extends StatefulWidget {
  const CustomerRegisterScreen({super.key});
  @override
  State<CustomerRegisterScreen> createState() => _CustomerRegisterScreenState();
}

class _CustomerRegisterScreenState extends State<CustomerRegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Customer Register")),
      body: const Column(
        children: [
          Text(""),
        ],
      ),
    );
  }
}
