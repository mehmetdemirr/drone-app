import 'package:auto_route/auto_route.dart';
import 'package:demo/core/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

@RoutePage()
class CompanyRegisterScreen extends StatefulWidget {
  const CompanyRegisterScreen({super.key});
  @override
  State<CompanyRegisterScreen> createState() => _CompanyRegisterScreenState();
}

class _CompanyRegisterScreenState extends State<CompanyRegisterScreen> {
  TextEditingController companyName =
      TextEditingController(text: "Belek Üniversitesi");
  TextEditingController phoneNumber =
      TextEditingController(text: "+9040004003392");
  TextEditingController mail =
      TextEditingController(text: "company@droneapp.com");

  TextEditingController password = TextEditingController(text: "12345678");
  TextEditingController passwordAgain = TextEditingController(text: "12345678");
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Company Register")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Şirket Kayıt Paneli",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: companyName,
                    decoration: const InputDecoration(
                      hintText: "Şirket adı",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'E-posta adresi boş olamaz';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
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
                    controller: phoneNumber,
                    decoration: const InputDecoration(
                      hintText: "Telefon numarasını giriniz",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Telefon Numarası boş olamaz';
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
                  TextFormField(
                    controller: passwordAgain,
                    obscureText: false,
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.visibility_off),
                      hintText: "Parolanızı tekrar giriniz",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Parola adresi boş olamaz';
                      }
                      if (value.length < 6) {
                        return 'Parola 6 karakterden küçük olamaz !';
                      }
                      if (passwordAgain.value != password.value) {
                        return 'Parolalar uyuşmuyor !';
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
                    child: const Text("Kayıt Ol"),
                  ),
                  TextButton(
                    onPressed: () {
                      context.router
                          .replaceNamed(RouterItem.companyLogin.str());
                    },
                    child: const Text("Şirket hesabın var mı ? Giriş Yap"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
