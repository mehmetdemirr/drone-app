import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:demo/core/extension/screen_size.dart';
import 'package:demo/core/helper/range_text_formetter.dart';
import 'package:demo/core/image_picker/service/pick_manager.dart';
import 'package:demo/core/log/log.dart';
import 'package:demo/core/utilty/images_items.dart';
import 'package:demo/product/company_products/service/company_product_service.dart';
import 'package:demo/product/general/model/base_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';

@RoutePage()
class CompanyNewProductScreen extends StatefulWidget {
  const CompanyNewProductScreen({super.key});
  @override
  State<CompanyNewProductScreen> createState() =>
      _CompanyNewProductScreenState();
}

class _CompanyNewProductScreenState extends State<CompanyNewProductScreen> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController tax = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController stockAmount = TextEditingController();
  XFile? _productImage;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yeni Ürün Ekle"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PopupMenuButton<String>(
                        child: _productImage != null
                            ? SizedBox(
                                width: context.width / 2,
                                height: 150,
                                child: Image.file(
                                  File(_productImage!.path),
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Image.asset(
                                width: context.width / 2,
                                height: 150,
                                ImageItem.defaultImage.str(),
                                fit: BoxFit.cover,
                              ),
                        onSelected: (String result) async {
                          // Seçilen öğeye göre işlem yapabilirsiniz
                          switch (result) {
                            case 'Option 1':
                              // Option 1 seçildiğinde yapılacak işlemler
                              final XFile? image =
                                  await PickManager().fetchImageGallery();
                              setState(() {
                                _productImage = image;
                              });
                              break;
                            case 'Option 2':
                              // Option 2 seçildiğinde yapılacak işlemler
                              final XFile? image =
                                  await PickManager().fetchImageCamera();
                              setState(() {
                                _productImage = image;
                              });
                              break;
                            // Diğer seçenekler için case'ler ekleyebilirsiniz
                          }
                        },
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<String>>[
                          const PopupMenuItem<String>(
                            value: 'Option 1',
                            child: Text('Galeriden Seç'),
                          ),
                          const PopupMenuItem<String>(
                            value: 'Option 2',
                            child: Text('Fotoğraf Çek'),
                          ),
                          // Diğer seçenekler için PopupMenuItem'lar ekleyebilirsiniz
                        ],
                      ),
                    ),
                    TextFormField(
                      controller: title,
                      decoration: const InputDecoration(
                        hintText: "Ürün başlığı",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Boş olamaz";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: description,
                      decoration: const InputDecoration(
                        hintText: "Ürün açıklama",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Boş olamaz";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: price,
                      decoration: const InputDecoration(
                        hintText: "Ürün fiyatı(örneğin 12.10)",
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d{0,2}'),
                        ),
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Boş olamaz";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: tax,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: false),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        RangeTextInputFormatter(min: 0, max: 100),
                      ],
                      decoration: const InputDecoration(
                        hintText: "Ürün vergi oranı(0-100)",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Boş olamaz";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: weight,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+\.?\d{0,2}')),
                      ],
                      decoration: const InputDecoration(
                        hintText: "Ürün ağırlığı (gram)",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Boş olamaz";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: stockAmount,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: false),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: const InputDecoration(
                        hintText: "Stok sayısı",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Boş olamaz";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    Log.info("ürün bilgileri doğru");
                    if (_productImage != null) {
                      BaseResponse response =
                          await CompanyProductService().createProduct(
                        _productImage!,
                        title.text,
                        description.text,
                        double.parse(price.text),
                        int.parse(tax.text),
                        int.parse(weight.text),
                        int.parse(stockAmount.text),
                      );
                      if (response.succeeded) {
                        EasyLoading.showSuccess("Ürün başarıyla eklendi");
                      } else {
                        EasyLoading.showError(
                            "Ürün eklenemedi.Error:${response.errors}-${response.message}");
                      }
                    } else {
                      EasyLoading.showError("Ürün fotoğrafı yükleyiniz !");
                    }
                  }
                },
                child: const Text("Ürün Ekle"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
