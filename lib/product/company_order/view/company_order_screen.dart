import 'package:auto_route/auto_route.dart';
import 'package:demo/core/extension/date_time.dart';
import 'package:demo/core/log/log.dart';
import 'package:demo/core/navigation/app_router.dart';
import 'package:demo/product/company_order/model/company_order_model.dart';
import 'package:demo/product/company_order/viewmodel/company_order_viewmodel.dart';
import 'package:demo/product/general/enum/order_status.dart';
import 'package:demo/product/general/extension/status_to_string.dart';
import 'package:demo/product/general/widget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class CompanyOrderScreen extends StatefulWidget {
  const CompanyOrderScreen({super.key});
  @override
  State<CompanyOrderScreen> createState() => _CompanyOrderScreenState();
}

class _CompanyOrderScreenState extends State<CompanyOrderScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((value) async {
      context.read<CompanyOrderViewModel>().orderListFetch(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Siparişler"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: InkWell(
              onTap: () {
                context.router.navigateNamed(RouterItem.companyNewOrder.str());
              },
              child: Container(
                height: 35,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(82, 0, 255, 1),
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: Colors.grey, width: 2)),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.add,
                        size: 15,
                        color: Colors.white,
                      ),
                      Text(
                        "Yeni Sipariş",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    context
                        .read<CompanyOrderViewModel>()
                        .changeOrderStatusItem(OrderStatusItem.tumu);
                  },
                  child: Text(
                    "Tümü",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: context
                                      .watch<CompanyOrderViewModel>()
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
                        .read<CompanyOrderViewModel>()
                        .changeOrderStatusItem(OrderStatusItem.siparisVerildi);
                  },
                  child: Text(
                    "Onay Bekleyen",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: context
                                      .watch<CompanyOrderViewModel>()
                                      .orderStatusItem ==
                                  OrderStatusItem.siparisVerildi
                              ? const Color.fromRGBO(82, 0, 255, 1)
                              : Colors.black38,
                        ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    context.read<CompanyOrderViewModel>().changeOrderStatusItem(
                        OrderStatusItem.siparisTeslimEdildi);
                  },
                  child: Text(
                    "Teslim Edilen",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: context
                                      .watch<CompanyOrderViewModel>()
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
                        .read<CompanyOrderViewModel>()
                        .changeOrderStatusItem(OrderStatusItem.siparisIptal);
                  },
                  child: Text(
                    "İptal",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: context
                                      .watch<CompanyOrderViewModel>()
                                      .orderStatusItem ==
                                  OrderStatusItem.siparisIptal
                              ? const Color.fromRGBO(82, 0, 255, 1)
                              : Colors.black38,
                        ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Ara",
                  prefixIcon: Icon(Icons.search_outlined),
                ),
              ),
            ),
            context.watch<CompanyOrderViewModel>().isLoading
                ? const Center(
                    child: LoadingWidget(),
                  )
                : Expanded(
                    child: _listViewBuilder(context
                            .watch<CompanyOrderViewModel>()
                            .orderModel
                            ?.data ??
                        []),
                  )
          ],
        ),
      ),
    );
  }

  Widget _listViewBuilder(List<Datum> list) {
    return list.isEmpty
        ? const Text("Sipariş bulunamadı !")
        : ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: InkWell(
                  onTap: () {
                    context.navigateTo(
                        CompanyOrderDetailRoute(id: list[index].id));
                  },
                  child: Card(
                    color: Colors.white,
                    elevation: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    list[index].username,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Sipariş Id:",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: const Color.fromRGBO(
                                              153, 153, 153, 1),
                                        ),
                                  ),
                                  Text(
                                    " ${list[index].id}  | ${list[index].count} Parça",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: const Color.fromRGBO(
                                              153, 153, 153, 1),
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    " ${list[index].totalPrice} TL",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          color: const Color.fromRGBO(
                                              82, 0, 255, 1),
                                        ),
                                  ),
                                  const SizedBox(width: 15),
                                  const Icon(Icons.flight_outlined),
                                  Text(
                                    " | ${list[index].createdAt.str()}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: const Color.fromRGBO(
                                              153, 153, 153, 1),
                                        ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Log.info("Sipariş detay");
                                  },
                                  icon: const Icon(
                                      Icons.keyboard_arrow_down_outlined),
                                ),
                                const SizedBox(height: 10),
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
                                      int.parse(list[index].statusId)
                                          .int2OrderStatus()
                                          .strOrderStatus2String(),
                                      style:
                                          Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                color: (int.parse(list[index].statusId) == 1 ||
                                                        int.parse(list[index]
                                                                .statusId) ==
                                                            2 ||
                                                        int.parse(list[index]
                                                                .statusId) ==
                                                            3 ||
                                                        int.parse(
                                                                list[index]
                                                                    .statusId) ==
                                                            4)
                                                    ? const Color.fromRGBO(
                                                        233, 181, 47, 1)
                                                    : int.parse(list[index]
                                                                .statusId) ==
                                                            5
                                                        ? const Color.fromRGBO(
                                                            0, 194, 13, 1)
                                                        : Colors.red.shade400,
                                              ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
