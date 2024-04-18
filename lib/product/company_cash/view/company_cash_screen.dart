import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CompanyCashScreen extends StatefulWidget {
  const CompanyCashScreen({super.key});
  @override
  State<CompanyCashScreen> createState() => _CompanyCashScreenState();
}

class _CompanyCashScreenState extends State<CompanyCashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kasam")),
      body: const Column(
        children: [
          Text("Toplam alacak | toplam aldığım | aylık-yıllık grafik vs "),
        ],
      ),
    );
  }
}
