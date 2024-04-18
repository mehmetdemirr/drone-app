import 'package:auto_route/auto_route.dart';
import 'package:demo/core/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

@RoutePage()
class CompanyLoginScreen extends StatefulWidget {
  const CompanyLoginScreen({super.key});
  @override
  State<CompanyLoginScreen> createState() => _CompanyLoginScreenState();
}

class _CompanyLoginScreenState extends State<CompanyLoginScreen> {
  TextEditingController mail =
      TextEditingController(text: "company@droneapp.com");
  TextEditingController password = TextEditingController(text: "12345678");
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Şirket Giriş Paneli",
              style: Theme.of(context).textTheme.titleMedium,
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
                              const CompanyHomeRoute(),
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
