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
      body: Column(
        children: [
          const Text(
              "Ödeme alınacak Siparişler | Ödenmiş tutarlar | en üstte toplamı yazacak"),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return const Card(
                  child: Column(
                    children: [
                      Text("sipariş id : 1232   Toplam : 200TL"),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
