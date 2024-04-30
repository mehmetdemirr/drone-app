import 'package:auto_route/auto_route.dart';
import 'package:demo/core/extension/price2string.dart';
import 'package:demo/core/extension/screen_size.dart';
import 'package:demo/product/company_statistic/model/company_statistic_model.dart';
import 'package:demo/product/company_statistic/viewmodel/company_statistic_viewmodel.dart';
import 'package:demo/product/general/widget/loading_widget.dart';
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
              child: LoadingWidget(),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _companyStatistic(context
                    .watch<CompanyStatisticViewModel>()
                    .companyStatisticModel),
              ),
            ),
    );
  }

  Column _companyStatistic(CompanyStatisticModel? model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            width: context.width / 1.5,
            height: context.width / 1.5,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(82, 0, 255, 1),
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.deepPurpleAccent,
                width: 1,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(5, 0, 255, 0.6),
                  spreadRadius: 10,
                  blurRadius: 75,
                  offset: Offset(-10, 10),
                  blurStyle: BlurStyle.normal,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                width: context.width / 3,
                height: context.width / 3,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(82, 0, 255, 1),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color.fromRGBO(128, 249, 136, 1),
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        double.parse(model?.orders.totalSales ?? "0")
                            .toCurrencyFormat(),
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                            ),
                      ),
                      Container(
                        width: 45,
                        height: 22,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Center(
                          child: Text(
                            '50%',
                            style: TextStyle(
                                color: Color.fromRGBO(82, 0, 255, 1),
                                fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: context.width / 2.5,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    offset: const Offset(0, 3),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${model?.orders.totalOrders}",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      "Toplam Sipariş Sayısı",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: context.width / 2.5,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    offset: const Offset(0, 3),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${model?.orders.successfulOrders}",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      "Başarılı Sipariş Sayısı",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: context.width / 2.5,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    offset: const Offset(0, 3),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${model?.orders.customerCount}",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      "Müşteri sayısı",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: context.width / 2.5,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    offset: const Offset(0, 3),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${model?.orders.totalSales}",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      "Toplam Satış Tutarı",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 16),
        Center(
          child: Text(
            "En Çok Satan Ürünler",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
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
