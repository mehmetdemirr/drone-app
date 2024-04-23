import 'package:auto_route/auto_route.dart';
import 'package:demo/core/cache/shared_pref.dart';
import 'package:demo/core/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

@RoutePage()
class CompanyShowQrScreen extends StatefulWidget {
  const CompanyShowQrScreen({super.key});
  @override
  State<CompanyShowQrScreen> createState() => _CompanyShowQrScreenState();
}

class _CompanyShowQrScreenState extends State<CompanyShowQrScreen> {
  int? companyId;
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      setState(() {
        Future.delayed(Duration.zero).then((value) async {
          companyId = await SharedPref().getCompanyId() ?? 0;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () async {
                await SharedPref().clearAll().then((value) {
                  //tüm routları temizle sadece splash kalsın
                  context.router.replaceAll(
                    [
                      const SplashRoute(),
                    ],
                  );
                });
              },
              icon: const Icon(Icons.exit_to_app_outlined),
            ),
            // Text(
            //   "Belek Üniversitesi",
            //   style: Theme.of(context).textTheme.titleMedium,
            // ),
            const SizedBox(
              height: 16,
            ),
            Text(companyId.toString() ?? "company id null"),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: PrettyQrView.data(
                data: '$companyId',
                // decoration: const PrettyQrDecoration(
                //   image: PrettyQrDecorationImage(
                //       // image: AssetImage('assets/images/app_icon.png'),
                //       ),
                // ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
