import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CompanyStatusFalseScreen extends StatefulWidget {
  const CompanyStatusFalseScreen({super.key});
  @override
  State<CompanyStatusFalseScreen> createState() =>
      _CompanyStatusFalseScreenState();
}

class _CompanyStatusFalseScreenState extends State<CompanyStatusFalseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                const Icon(
                  Icons.error,
                  size: 100,
                ),
                Text(
                  textAlign: TextAlign.center,
                  "Lütfen bizimle iletişime geçin.\nHesabınızın onaya ihtiyacı var.\ndogukantuncay1@gmail.com",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
