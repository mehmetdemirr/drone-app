import 'package:auto_route/auto_route.dart';
import 'package:demo/core/cache/shared_pref.dart';
import 'package:demo/core/log/log.dart';
import 'package:demo/core/navigation/app_router.dart';
import 'package:demo/core/utilty/images_items.dart';
import 'package:demo/product/customer_home/model/customer_info_model.dart';
import 'package:demo/product/customer_home/service/customer_info_service.dart';
import 'package:demo/product/customer_login/model/customer_token_model.dart';
import 'package:demo/product/customer_login/service/customer_login_service.dart';
import 'package:demo/product/customer_login/viewmodel/customer_login_viewmodel.dart';
import 'package:demo/product/general/model/base_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:provider/provider.dart';

@RoutePage()
class CustomerLoginScreen extends StatefulWidget {
  const CustomerLoginScreen({super.key});
  @override
  State<CustomerLoginScreen> createState() => _CustomerLoginScreenState();
}

class _CustomerLoginScreenState extends State<CustomerLoginScreen> {
  TextEditingController mail = TextEditingController(text: "test@customer.com");
  TextEditingController password = TextEditingController(text: "123456");
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
                      obscureText: context
                          .watch<CustomerLoginViewModel>()
                          .passwordVisible,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              context
                                  .read<CustomerLoginViewModel>()
                                  .passwordChangeVisible();
                            },
                            icon: Icon(
                              context
                                      .watch<CustomerLoginViewModel>()
                                      .passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            )),
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
                            BaseResponse<CustomerTokenModel> response =
                                await CustomerLoginService().customerLogin(
                                    mail.text, password.text, id);
                            if (response.succeeded &&
                                response.data?.token != null) {
                              await SharedPref()
                                  .setCustomerToken(response.data?.token ?? "")
                                  .then((value) async {
                                EasyLoading.showSuccess(
                                    response.message ?? "Giriş Yapıldı");
                                BaseResponse<CustomerInfoModel?> userInfo =
                                    await CustomerInfoService().customerInfo();
                                if (userInfo.data?.activeCompany == "true") {
                                  //tüm routları temizle sadece customer ana sayfa kalsın
                                  // ignore: use_build_context_synchronously
                                  context.router.replaceAll(
                                    [
                                      const CustomerHomeRoute(),
                                    ],
                                  );
                                } else if (userInfo.data?.activeCompany ==
                                    "waiting") {
                                  //tüm routları temizle sadece customer ana sayfa kalsın
                                  // ignore: use_build_context_synchronously
                                  context.router.replaceAll(
                                    [
                                      const CustomerWaitingRoomRoute(),
                                    ],
                                  );
                                } else if (userInfo.data?.activeCompany ==
                                    "false") {
                                  //tüm routları temizle sadece customer ana sayfa kalsın
                                  // ignore: use_build_context_synchronously
                                  context.router.replaceAll(
                                    [
                                      const CustomerAreaLoginRoute(),
                                    ],
                                  );
                                }
                              });
                            } else {
                              EasyLoading.showError(
                                  "Giriş başarısız ! \nError:${response.message}");
                            }
                          } else {
                            Log.error("onesignal id yok");
                            EasyLoading.showError(
                                "Uygulamadan çıkıp tekrar deneyiniz !.Error:Onesignal id alınamadı!");
                          }
                        } else {
                          EasyLoading.showError(
                              "Verileri düzgün formatta giriniz!");
                        }
                      },
                      child: const Text("Giriş"),
                    ),
                    TextButton(
                      onPressed: () {
                        context.router
                            .replaceNamed(RouterItem.customerRegister.str());
                      },
                      child: const Text("Hesabın yok mu ? Kayıt Ol"),
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
