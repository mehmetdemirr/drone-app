import 'package:auto_route/auto_route.dart';
import 'package:demo/product/general/grafikler/pie_chart_widget.dart';
import 'package:demo/product/general/grafikler/spline_area_chart_widget.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CustomerStatisticScreen extends StatefulWidget {
  const CustomerStatisticScreen({super.key});
  @override
  State<CustomerStatisticScreen> createState() =>
      _CustomerStatisticScreenState();
}

class _CustomerStatisticScreenState extends State<CustomerStatisticScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ana Sayfa")),
      body: const Column(
        children: [
          Text("Müşteri üye olduğu şirketler | istatistikleri"),
          Expanded(child: PieChartWidget()),
          Expanded(child: SplineAreaChartWidget()),
        ],
      ),
    );
  }
}
