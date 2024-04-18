import 'package:auto_route/auto_route.dart';
import 'package:demo/core/extension/screen_size.dart';
import 'package:demo/core/navigation/app_router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CustomerOrderConfirmScreen extends StatefulWidget {
  const CustomerOrderConfirmScreen({super.key});
  @override
  State<CustomerOrderConfirmScreen> createState() =>
      _CustomerOrderConfirmScreenState();
}

class _CustomerOrderConfirmScreenState
    extends State<CustomerOrderConfirmScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sipariş Tamamlama")),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Form(
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Notunuz var mı? (varsa)",
                    ),
                    minLines: 2,
                    maxLines: 3,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50.0),
                    child: Text("Konum al bu alanda (bölge seç + haritadan)"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Container(
          height: 50,
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  // EasyLoading.showSuccess(
                  //     "İşlem tamamladı.Sipariş alındığında bilgilendirme yapılacaktır !");
                  context.navigateNamedTo(RouterItem.customerOrderSucces.str());
                },
                child: Container(
                  width: context.width / 2,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.grey, width: 2)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "İşlemi Tamamla",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Colors.black,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
