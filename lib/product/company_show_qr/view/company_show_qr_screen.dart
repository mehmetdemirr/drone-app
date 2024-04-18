import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

@RoutePage()
class CompanyShowQrScreen extends StatefulWidget {
  const CompanyShowQrScreen({super.key});
  @override
  State<CompanyShowQrScreen> createState() => _CompanyShowQrScreenState();
}

class _CompanyShowQrScreenState extends State<CompanyShowQrScreen> {
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
            Text(
              "Belek Üniversitesi",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 16,
            ),
            PrettyQrView.data(
              data: 'lorem ipsum dolor sit amet',
              decoration: const PrettyQrDecoration(
                image: PrettyQrDecorationImage(
                  image: AssetImage('assets/images/app_icon.png'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
