import 'package:auto_route/auto_route.dart';
import 'package:demo/core/extension/screen_size.dart';
import 'package:demo/product/company_area/model/company_area_model.dart';
import 'package:demo/product/company_area/service/company_area_service.dart';
import 'package:demo/product/general/model/base_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

@RoutePage()
class CompanyNewAreaScreen extends StatefulWidget {
  const CompanyNewAreaScreen({super.key});
  @override
  State<CompanyNewAreaScreen> createState() => _CompanyNewAreaScreenState();
}

class _CompanyNewAreaScreenState extends State<CompanyNewAreaScreen> {
  TextEditingController title = TextEditingController();
  TextEditingController desciption = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Şirket Alan Ekle"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: title,
                  decoration: const InputDecoration(
                    hintText: "Alan başlık",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Boş bırakılamaz !";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: desciption,
                  minLines: 2,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    hintText: "Alan açıklama",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Boş bırakılamaz !";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: InkWell(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        BaseResponse<CompanyAreaModel?> response =
                            await CompanyAreaService()
                                .createArea(title.text, desciption.text);
                        if (response.succeeded) {
                          EasyLoading.showSuccess("Alan başarıyla eklendi.");
                          // ignore: deprecated_member_use, use_build_context_synchronously
                          context.router.pop();
                        } else {
                          EasyLoading.showError(
                              "Alan eklenemedi.Error:${response.message}-${response.errors}");
                        }
                      }
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
          ),
        ),
      ),
    );
  }
}
