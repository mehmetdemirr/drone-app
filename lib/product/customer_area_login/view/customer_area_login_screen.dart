import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:demo/core/extension/screen_size.dart';
import 'package:demo/core/navigation/app_router.dart';
import 'package:demo/product/customer_area_login/widget/qr_border_paint.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

@RoutePage()
class CustomerAreaLoginScreen extends StatefulWidget {
  const CustomerAreaLoginScreen({super.key});
  @override
  State<CustomerAreaLoginScreen> createState() =>
      _CustomerAreaLoginScreenState();
}

class _CustomerAreaLoginScreenState extends State<CustomerAreaLoginScreen> {
  Barcode? result;
  QRViewController? controller;
  GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(82, 0, 255, 1),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Text(
                "Qr Kodu Tarayın",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 5),
              Text(
                textAlign: TextAlign.center,
                "İşletme girişindeki Qr kodu cihazınız ile tarayıp işletmeye girdiğinizi doğrulayın",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: context.height * .60,
                width: context.width * 0.85,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(217, 217, 217, 1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                ),
                child: SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 180, horizontal: 90),
                    child: CustomPaint(
                      foregroundPainter: BorderPainter(),
                      child: SizedBox(
                        // decoration: BoxDecoration(
                        //   color: Colors.grey.shade100,
                        //   borderRadius: const BorderRadius.all(
                        //     Radius.circular(16.0),
                        //   ),
                        // ),
                        child: QRView(
                          key: qrKey,
                          onQRViewCreated: _onQRViewCreated,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  result != null
                      ? 'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}'
                      : '',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
              Text(
                "Okuduktan sonra otomatik işletmeye giriş yapacak \n Not: Giriş yapmışsa bu sayfa gözükmeyecek !",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white,
                    ),
              ),
              ElevatedButton(
                onPressed: () {
                  EasyLoading.showSuccess("Giriş başarılı");
                  //tüm routları temizle sadece customer ana sayfa kalsın
                  context.router.replaceAll(
                    [
                      const CustomerHomeRoute(),
                    ],
                  );
                },
                child: const Text("Tesise giriş yap(şimdilik)"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
