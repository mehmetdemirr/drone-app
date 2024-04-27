import 'package:auto_route/auto_route.dart';
import 'package:demo/core/cache/shared_pref.dart';
import 'package:demo/core/log/log.dart';
import 'package:demo/core/navigation/app_router.dart';
import 'package:demo/product/company_login/model/company_model.dart';
import 'package:demo/product/company_login/service/company_login_service.dart';
import 'package:demo/product/general/model/base_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

@RoutePage()
class CompanyLoginScreen extends StatefulWidget {
  const CompanyLoginScreen({super.key});
  @override
  State<CompanyLoginScreen> createState() => _CompanyLoginScreenState();
}

class _CompanyLoginScreenState extends State<CompanyLoginScreen> {
  TextEditingController mail = TextEditingController(text: "test@company.com");
  TextEditingController password = TextEditingController(text: "123456");
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
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final id = OneSignal.User.pushSubscription.id;
                          if (id != null) {
                            await SharedPref().setOnesignalId(id);
                            Log.info("Onesignal id: $id");
                            BaseResponse<CompanyTokenModel?> response =
                                await CompanyLoginService().companyLogin(
                              mail.text,
                              password.text,
                              id,
                            );
                            if (response.succeeded) {
                              EasyLoading.showSuccess("Giriş başarılı ");
                              //tüm routları temizle sadece company ana sayfa kalsın
                              await SharedPref()
                                  .setCompanyToken(response.data?.token ?? "")
                                  .then((value) {
                                // ignore: use_build_context_synchronously
                                context.router.replaceAll(
                                  [
                                    const CompanyHomeRoute(),
                                  ],
                                );
                              });
                            } else {
                              if (response.errors == "1") {
                                // ignore: use_build_context_synchronously
                                context.router.replaceAll(
                                  [
                                    const CompanyStatusFalseRoute(),
                                  ],
                                );
                              } else {
                                EasyLoading.showError(
                                    "Giriş başarısız !\nError:${response.message}-${response.errors}");
                              }
                            }
                          } else {
                            EasyLoading.showError("Onesignal id error");
                          }
                        } else {
                          EasyLoading.showError(
                              "Verileri düzgün formatta giriniz!");
                        }
                      },
                      child: const Text("Giriş"),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final id = OneSignal.User.pushSubscription.id;
                          if (id != null) {
                            await SharedPref().setOnesignalId(id);
                            Log.info("Onesignal id: $id");
                            BaseResponse<CompanyTokenModel?> response =
                                await CompanyLoginService().companyLogin(
                              mail.text,
                              password.text,
                              id,
                            );
                            if (response.succeeded) {
                              EasyLoading.showSuccess("Giriş başarılı ");
                              //tüm routları temizle sadece company ana sayfa kalsın
                              await SharedPref()
                                  .setCompanyId(response.data?.companyId ?? -1)
                                  .then((value) {
                                // ignore: use_build_context_synchronously
                                context.router.replaceAll(
                                  [
                                    const CompanyShowQrRoute(),
                                  ],
                                );
                              });
                            } else {
                              if (response.errors == "1") {
                                // ignore: use_build_context_synchronously
                                context.router.replaceAll(
                                  [
                                    const CompanyStatusFalseRoute(),
                                  ],
                                );
                              } else {
                                EasyLoading.showError(
                                    "Giriş başarısız !\nError:${response.message}-${response.errors}");
                              }
                            }
                          } else {
                            EasyLoading.showError("Onesignal id error");
                          }
                        } else {
                          EasyLoading.showError(
                              "Verileri düzgün formatta giriniz!");
                        }
                      },
                      child: const Text("Qr Giriş"),
                    ),
                    TextButton(
                      onPressed: () {
                        context.router
                            .replaceNamed(RouterItem.companyRegister.str());
                      },
                      child: const Text("Şirket hesabın yok mu ? Kayıt Ol"),
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
