import 'package:auto_route/auto_route.dart';
import 'package:demo/core/extension/date_time.dart';
import 'package:demo/product/customer_cash/model/customer_cash_model.dart';
import 'package:demo/product/customer_cash/viewmodel/customer_cash_viewmodel.dart';
import 'package:demo/product/general/enum/order_status.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class CustomerCashScreen extends StatefulWidget {
  const CustomerCashScreen({super.key});
  @override
  State<CustomerCashScreen> createState() => _CustomerCashScreenState();
}

class _CustomerCashScreenState extends State<CustomerCashScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      setState(() {
        Future.delayed(Duration.zero).then((value) async {
          context.read<CustomerCashViewModel>().orderListFetch(1);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Son Siparişlerim"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  context
                      .read<CustomerCashViewModel>()
                      .changeOrderStatusItem(OrderStatusItem.tumu);
                },
                child: Text(
                  "Tümü",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: context
                                    .watch<CustomerCashViewModel>()
                                    .orderStatusItem ==
                                OrderStatusItem.tumu
                            ? const Color.fromRGBO(82, 0, 255, 1)
                            : Colors.black38,
                      ),
                ),
              ),
              InkWell(
                onTap: () {
                  context
                      .read<CustomerCashViewModel>()
                      .changeOrderStatusItem(OrderStatusItem.siparisVerildi);
                },
                child: Text(
                  "Bekleyen",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: context
                                    .watch<CustomerCashViewModel>()
                                    .orderStatusItem ==
                                OrderStatusItem.siparisVerildi
                            ? const Color.fromRGBO(82, 0, 255, 1)
                            : Colors.black38,
                      ),
                ),
              ),
              InkWell(
                onTap: () {
                  context.read<CustomerCashViewModel>().changeOrderStatusItem(
                      OrderStatusItem.siparisTeslimEdildi);
                },
                child: Text(
                  "Teslim Edilen",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: context
                                    .watch<CustomerCashViewModel>()
                                    .orderStatusItem ==
                                OrderStatusItem.siparisTeslimEdildi
                            ? const Color.fromRGBO(82, 0, 255, 1)
                            : Colors.black38,
                      ),
                ),
              ),
              InkWell(
                onTap: () {
                  context
                      .read<CustomerCashViewModel>()
                      .changeOrderStatusItem(OrderStatusItem.siparisIptal);
                },
                child: Text(
                  "İptal",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: context
                                    .watch<CustomerCashViewModel>()
                                    .orderStatusItem ==
                                OrderStatusItem.siparisIptal
                            ? const Color.fromRGBO(82, 0, 255, 1)
                            : Colors.black38,
                      ),
                ),
              ),
            ],
          ),
          context.watch<CustomerCashViewModel>().isLoading
              ? const Center(child: CircularProgressIndicator.adaptive())
              : Expanded(
                  child: _listViewBuilder(
                      context.watch<CustomerCashViewModel>().orderModel?.data),
                ),
        ],
      ),
    );
  }

  Widget _listViewBuilder(List<Datum>? list) {
    return (list == null || list.isEmpty)
        ? const Text("Sipariş bulunamadı !")
        : ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Sipariş Toplamı:${list[index].totalPrice}"),
                        Text("Sipariş Tarihi:${list[index].updatedAt.str()}"),
                        Text("Sipariş Durumu:${list[index].status.name}"),
                        Text("Tesis Adı :${list[index].company.title}"),
                        Text(
                            "Ödeme Durumu :${(list[index].paymentStatus == null) ? 'ödenmedi' : list[index].paymentStatus?.name}"),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
  }
}
