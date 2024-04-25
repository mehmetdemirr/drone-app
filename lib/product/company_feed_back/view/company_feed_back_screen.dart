import 'package:auto_route/auto_route.dart';
import 'package:demo/core/extension/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

@RoutePage()
class CompanyFeedBackScreen extends StatefulWidget {
  const CompanyFeedBackScreen({super.key});
  @override
  State<CompanyFeedBackScreen> createState() => _CompanyFeedBackScreenState();
}

class _CompanyFeedBackScreenState extends State<CompanyFeedBackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Geri Bildirim"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: context.height * 0.05,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Teşekkürler !",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Teşekkürler! Bize düşüncelerinizi söylemek için zaman ayırdığınız için teşekkür ederiz, bu bizim için çok önemli.\n\n\n"
                  "Eğer paylaşmak istediğiniz başka bir şey varsa, lütfen aşağıya ekleyin.",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                const TextField(
                  minLines: 5,
                  maxLines: 10,
                  decoration: InputDecoration(
                    hintText: "Geri bildirim metnini yazabilirsiniz",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      EasyLoading.showSuccess(
                          "Geri bildirim için teşekkürler !");
                      // ignore: deprecated_member_use
                      context.router.pop();
                    },
                    child: Container(
                      width: context.width / 2,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.grey, width: 2)),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            "Gönder",
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: Colors.black,
                                    ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
