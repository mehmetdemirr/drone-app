import 'package:auto_route/auto_route.dart';
import 'package:demo/product/company_home/service/company_info_service.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CompanyStatisticScreen extends StatefulWidget {
  const CompanyStatisticScreen({super.key});
  @override
  State<CompanyStatisticScreen> createState() => _CompanyStatisticScreenState();
}

class _CompanyStatisticScreenState extends State<CompanyStatisticScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((value) async {
      //company bilgi
      await CompanyInfoService().companyInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("İstatistiklerim"),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            textAlign: TextAlign.center,
            "Sonraki aşama olacak İstatistik \n en çok satan ürün , kritik stok , aylık-günlük-yıllık istatistik grafiği vs ",
          ),
        ],
      ),
    );
  }
}
