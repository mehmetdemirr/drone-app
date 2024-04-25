import 'package:auto_route/auto_route.dart';
import 'package:demo/core/navigation/app_router.dart';
import 'package:demo/product/company_register/service/company_register_service.dart';
import 'package:demo/product/general/model/base_response.dart';
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
  TextEditingController phoneNumber = TextEditingController(text: "1");
  TextEditingController mail = TextEditingController(text: "test@company.com");

  TextEditingController password = TextEditingController(text: "123456");
  TextEditingController passwordAgain = TextEditingController(text: "123456");
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
                      if (value != password.text) {
                        return 'Parolalar uyuşmuyor !';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        BaseResponse response =
                            await CompanyRegisterService().companyRegister(
                          companyName.text,
                          phoneNumber.text,
                          mail.text,
                          password.text,
                        );
                        if (response.succeeded) {
                          EasyLoading.showSuccess("Kayıt başarılı ");
                          //tüm routları temizle sadece customer ana sayfa kalsın
                          // ignore: use_build_context_synchronously
                          context.router.replaceAll(
                            [
                              const CompanyStatusFalseRoute(),
                            ],
                          );
                        } else {
                          EasyLoading.showError(
                              "Kayıt başarısız! Error:${response.errors}-${response.message}");
                        }
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
