import 'package:auto_route/auto_route.dart';
import 'package:demo/product/company_statistic/model/company_statistic_model.dart';
import 'package:demo/product/company_statistic/viewmodel/company_statistic_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      context.read<CompanyStatisticViewModel>().fetchCompanyStatistic();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("İstatistiklerim"),
      ),
      body: context.watch<CompanyStatisticViewModel>().isLoading
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: _companyStatistic(context
                  .watch<CompanyStatisticViewModel>()
                  .companyStatisticModel),
            ),
    );
  }

  Column _companyStatistic(CompanyStatisticModel? model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textAlign: TextAlign.center,
          "Toplam Sipariş sayısı :${model?.orders.totalOrders}",
        ),
        Text("Başarılı sipariş sayısı: ${model?.orders.successfulOrders}"),
        Text("Toplam satış tutarı: ${model?.orders.totalSales}"),
        Text("Müşteri sayısı: ${model?.orders.customerCount}"),
        const SizedBox(height: 10),
        const Text("En Çok Satan Ürünler"),
        SizedBox(
          height: 300,
          child: _enCokSatanUrunler(model?.products.topSeller ?? []),
        ),
      ],
    );
  }

  ListView _enCokSatanUrunler(List<Seller> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(list[index].title),
                      Text(list[index].description),
                      Text("Satış adeti :${list[index].totalSold}"),
                    ],
                  ),
                  const Spacer(),
                  Text(list[index].price),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
