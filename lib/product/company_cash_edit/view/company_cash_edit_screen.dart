import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CompanyCashEditScreen extends StatefulWidget {
  const CompanyCashEditScreen({
    super.key,
    @PathParam('id') required this.id,
  });
  final int id;
  @override
  State<CompanyCashEditScreen> createState() => _CompanyCashEditScreenState();
}

class _CompanyCashEditScreenState extends State<CompanyCashEditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ödeme Detay")),
      body: const Column(
        children: [
          Text(
              "Ödeme Yapıldıysa ödeme yapıldı de yapılmadıysa ödemeyi tamamla butonu yap ve ödeme yapsın "),
        ],
      ),
    );
  }
}
