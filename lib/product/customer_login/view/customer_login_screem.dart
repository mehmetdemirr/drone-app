import 'package:auto_route/auto_route.dart';
import 'package:demo/core/log/log.dart';
import 'package:demo/core/navigation/app_router.dart';
import 'package:demo/core/utilty/images_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

@RoutePage()
class CustomerLoginScreen extends StatefulWidget {
  const CustomerLoginScreen({super.key});
  @override
  State<CustomerLoginScreen> createState() => _CustomerLoginScreenState();
}

class _CustomerLoginScreenState extends State<CustomerLoginScreen> {
  TextEditingController mail =
      TextEditingController(text: "customer@droneapp.com");
  TextEditingController password = TextEditingController(text: "12345678");
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(ImageItem.customerLogin.str()),
                Positioned(
                  top: 50,
                  right: 0,
                  child: InkWell(
                    onTap: () {
                      Log.info("Company login clicked");
                      //tüm routları temizle sadece customer ana sayfa kalsın
                      context.router.replaceAll(
                        [
                          const CompanyLoginRoute(),
                        ],
                      );
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: mail,
                      decoration: const InputDecoration(
                        hintText: "E-Mail giriniz",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'E-posta adresi boş olamaz';
                        }
                        if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                          return 'Geçerli bir e-posta adresi girin';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: password,
                      obscureText: false,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.visibility_off),
                        hintText: "Parolanızı giriniz",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Parola adresi boş olamaz';
                        }
                        if (value.length < 6) {
                          return 'Parola 6 karakterden küçük olamaz !';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          EasyLoading.showSuccess("Giriş başarılı ");
                          //tüm routları temizle sadece customer ana sayfa kalsın
                          context.router.replaceAll(
                            [
                              const CustomerAreaLoginRoute(),
                            ],
                          );
                        } else {
                          EasyLoading.showError(
                              "Verileri düzgün formatta giriniz!");
                        }
                      },
                      child: const Text("Giriş"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
