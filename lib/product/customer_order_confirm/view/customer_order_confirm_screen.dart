// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:demo/core/navigation/app_router.dart';
import 'package:demo/product/customer_basket/service/customer_basket_service.dart';
import 'package:demo/product/customer_order_confirm/viewmodel/customer_order_confirm_viewmodel.dart';
import 'package:demo/product/general/model/base_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

import 'package:demo/core/extension/screen_size.dart';
import 'package:demo/core/location/location_manager.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:provider/provider.dart';

@RoutePage()
class CustomerOrderConfirmScreen extends StatefulWidget {
  const CustomerOrderConfirmScreen({
    super.key,
    required this.locationData,
  });
  final LocationData locationData;
  @override
  State<CustomerOrderConfirmScreen> createState() =>
      _CustomerOrderConfirmScreenState();
}

class _CustomerOrderConfirmScreenState
    extends State<CustomerOrderConfirmScreen> {
  late LocationData locationData;
  LatLng initialLocationData = const LatLng(32, 23);

  final MultiSelectController _controller = MultiSelectController();
  final TextEditingController _description = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    locationData = widget.locationData;
    Future.delayed(Duration.zero).then((value) async {
      context.read<CustomerOrderConfirmViewModel>().fetchCompanyArea();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sipariş Tamamlama"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                Future.delayed(Duration.zero).then((value) async {
                  LocationData? response =
                      await LocationManager().getLoacation();
                  if (response != null) {
                    locationData = response;
                  } else {
                    EasyLoading.showError("Konum null geldi");
                  }
                });
              });
              EasyLoading.showSuccess(
                  "Konum => lat:${locationData.latitude} long:${locationData.longitude}");
            },
            icon: const Icon(Icons.location_on_rounded),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _description,
                      decoration: const InputDecoration(
                        hintText: "Notunuz var mı? (varsa)",
                      ),
                      minLines: 1,
                      maxLines: 2,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Boş bırakılamaz";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    context.watch<CustomerOrderConfirmViewModel>().isLoading
                        ? const Center(
                            child: CircularProgressIndicator.adaptive())
                        : MultiSelectDropDown(
                            hint: "Tesis alanı seç",
                            controller: _controller,
                            onOptionSelected: (options) {
                              debugPrint(options.toString());
                            },
                            options: context
                                    .watch<CustomerOrderConfirmViewModel>()
                                    .companyAreaList
                                    ?.map((model) {
                                  return ValueItem(
                                    label: model.title,
                                    value: model.id,
                                  );
                                }).toList() ??
                                [],
                            // maxItems: 2,
                            // disabledOptions: const [
                            //   ValueItem(label: 'Option 1', value:1 )
                            // ],
                            selectionType: SelectionType.single,
                            chipConfig:
                                const ChipConfig(wrapType: WrapType.wrap),
                            dropdownHeight: 300,
                            optionTextStyle: const TextStyle(fontSize: 16),
                            selectedOptionIcon: const Icon(Icons.check_circle),
                          ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 300,
                      width: context.width,
                      child: FlutterMap(
                        options: MapOptions(
                          initialCenter: LatLng(
                            locationData.latitude ??
                                initialLocationData.latitude,
                            locationData.longitude ??
                                initialLocationData.longitude,
                          ),
                        ),
                        children: [
                          TileLayer(
                            minZoom: 10,
                            urlTemplate:
                                'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                            // userAgentPackageName: 'com.example.app',
                          ),
                          MarkerLayer(
                            markers: [
                              Marker(
                                point: LatLng(
                                  locationData.latitude ??
                                      initialLocationData.latitude,
                                  locationData.longitude ??
                                      initialLocationData.longitude,
                                ),
                                width: 37,
                                height: 42,
                                child: const FlutterLogo(),
                              ),
                            ],
                          ),
                          PolylineLayer(
                            polylineCulling: false,
                            polylines: [
                              Polyline(
                                points: [
                                  // LatLng(
                                  //   locationData?.latitude ?? 0,
                                  //   locationData?.longitude ?? 0,
                                  // ),
                                  const LatLng(
                                    37,
                                    42,
                                  ),
                                ],
                                color: Colors.blue,
                                strokeWidth: 100,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Container(
          height: 50,
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: Column(
            children: [
              InkWell(
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    if (_controller.selectedOptions.isNotEmpty) {
                      BaseResponse response =
                          await CustomerBasketService().confirmBasket(
                        locationData.longitude ?? 0,
                        locationData.longitude ?? 0,
                        _description.text,
                        _controller.selectedOptions[0].value as int,
                      );
                      if (response.succeeded) {
                        EasyLoading.showSuccess(
                            "İşlem tamamladı.Sipariş alındığında bilgilendirme yapılacaktır !");
                        // ignore: use_build_context_synchronously
                        context.navigateNamedTo(
                            RouterItem.customerOrderSucces.str());
                      } else {
                        EasyLoading.showError(
                            "Sepet onaylanamadı.Error:${response.errors}-${response.message}");
                      }
                    } else {
                      EasyLoading.showError("Lütfen tesis alanı seçin !");
                    }
                  } else {
                    EasyLoading.showError("Zorunlu alanları doldurunuz");
                  }
                },
                child: Container(
                  width: context.width / 2,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.grey, width: 2)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "İşlemi Tamamla",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Colors.black,
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
    );
  }
}
