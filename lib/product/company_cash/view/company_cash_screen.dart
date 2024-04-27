import 'package:auto_route/auto_route.dart';
import 'package:demo/core/navigation/app_router.dart';
import 'package:demo/product/company_cash/model/company_cash_model.dart';
import 'package:demo/product/company_cash/viewmodel/campany_cash_viewmodel.dart';
import 'package:demo/product/general/enum/payment_status.dart';
import 'package:demo/product/general/widget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class CompanyCashScreen extends StatefulWidget {
  const CompanyCashScreen({super.key});
  @override
  State<CompanyCashScreen> createState() => _CompanyCashScreenState();
}

class _CompanyCashScreenState extends State<CompanyCashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((value) async {
      context.read<CompanyCashViewModel>().orderListFetch(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kasam"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    context
                        .read<CompanyCashViewModel>()
                        .changePaymentStatusItem(
                            PaymentStatusItem.odemeBekleniyor);
                  },
                  child: Text(
                    "Bekleyen Ödemeler",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: context
                                      .watch<CompanyCashViewModel>()
                                      .paymentStatusItem ==
                                  PaymentStatusItem.odemeBekleniyor
                              ? const Color.fromRGBO(82, 0, 255, 1)
                              : Colors.black38,
                        ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    context
                        .read<CompanyCashViewModel>()
                        .changePaymentStatusItem(PaymentStatusItem.odendi);
                  },
                  child: Text(
                    "Ödenmiş Ödemeler",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: context
                                      .watch<CompanyCashViewModel>()
                                      .paymentStatusItem ==
                                  PaymentStatusItem.odendi
                              ? const Color.fromRGBO(82, 0, 255, 1)
                              : Colors.black38,
                        ),
                  ),
                ),
              ],
            ),
          ),
          context.watch<CompanyCashViewModel>().isLoading
              ? const Center(
                  child: LoadingWidget(),
                )
              : Expanded(
                  child: _listViewBuilder(
                      context.watch<CompanyCashViewModel>().orderModel),
                ),
        ],
      ),
    );
  }

  Widget _listViewBuilder(CompanyCashModel? orderModel) {
    return orderModel == null
        ? const Text("Ödeme bulunamadı !")
        : (orderModel.data.isEmpty)
            ? const Text("Ödeme bulunamadı !")
            : ListView.builder(
                itemCount: orderModel.data.length,
                itemBuilder: (context, index) {
                  DatumCompanyCash data = orderModel.data[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        context.navigateTo(CompanyCashEditRoute(id: 1));
                      },
                      child: Card(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(data.username),
                                      Text("Toplam : ${data.totalPrice} TL")
                                    ],
                                  ),
                                  const Spacer(),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color.fromRGBO(
                                            184, 184, 201, 1),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Text(
                                        data.paymentStatusId == "2"
                                            ? "Ödeme Alındı"
                                            : "Bekliyor",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                              color: data.paymentStatusId == "2"
                                                  ? const Color.fromRGBO(
                                                      0, 194, 13, 1)
                                                  : const Color.fromRGBO(
                                                      233, 181, 47, 1),
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
  }
}
