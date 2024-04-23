import 'package:auto_route/auto_route.dart';
import 'package:demo/product/company_customer/model/company_customer_user_model.dart';
import 'package:demo/product/company_customer/viewmodel/company_customer_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class CompanyCustomerScreen extends StatefulWidget {
  const CompanyCustomerScreen({super.key});
  @override
  State<CompanyCustomerScreen> createState() => _CompanyCustomerScreenState();
}

class _CompanyCustomerScreenState extends State<CompanyCustomerScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      setState(() {
        Future.delayed(Duration.zero).then((value) async {
          context.read<CompanyCustomerViewModel>().userListFetch();
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Müşterilerim"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  context.read<CompanyCustomerViewModel>().changeStatus(1);
                },
                child: Text(
                  "Onay Bekleyen",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color:
                            context.watch<CompanyCustomerViewModel>().status ==
                                    1
                                ? const Color.fromRGBO(82, 0, 255, 1)
                                : Colors.black38,
                      ),
                ),
              ),
              InkWell(
                onTap: () {
                  context.read<CompanyCustomerViewModel>().changeStatus(2);
                },
                child: Text(
                  "İçerdeki Müşteri",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color:
                            context.watch<CompanyCustomerViewModel>().status ==
                                    2
                                ? const Color.fromRGBO(82, 0, 255, 1)
                                : Colors.black38,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          context.watch<CompanyCustomerViewModel>().isLoading
              ? const CircularProgressIndicator.adaptive()
              : Expanded(
                  child: _listviewBuilder(
                      context.watch<CompanyCustomerViewModel>().musteriList),
                )
        ],
      ),
    );
  }

  Widget _listviewBuilder(List<CompanyCustomerUserModel>? list) {
    return list == null
        ? const Text("Müşteri listesi yüklenemedi")
        : list.isEmpty
            ? const Text("Müşteri listesi boş")
            : ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "${list[index].name} ${list[index].surname}"),
                                Text(list[index].email),
                              ],
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                context
                                    .read<CompanyCustomerViewModel>()
                                    .musteriSil(
                                        int.parse(list[index].pivot.id));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.red.shade100,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    )),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text("Sil"),
                                ),
                              ),
                            ),
                            const SizedBox(width: 3),
                            context.watch<CompanyCustomerViewModel>().status ==
                                    2
                                ? const SizedBox()
                                : InkWell(
                                    onTap: () {
                                      context
                                          .read<CompanyCustomerViewModel>()
                                          .musteriOnayla(
                                              int.parse(list[index].pivot.id));
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          color: Colors.black12,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          )),
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text("Onayla"),
                                      ),
                                    ),
                                  )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
  }
}
