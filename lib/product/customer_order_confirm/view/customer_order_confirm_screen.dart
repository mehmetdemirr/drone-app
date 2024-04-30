// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:demo/core/log/log.dart';
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
  LatLng locationData = const LatLng(0, 0);

  final MultiSelectController _controller = MultiSelectController();
  final TextEditingController _description = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    locationData = LatLng(
        widget.locationData.latitude ?? 0, widget.locationData.longitude ?? 0);
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
                    locationData =
                        LatLng(response.latitude ?? 0, response.longitude ?? 0);
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
                            locationData.latitude,
                            locationData.longitude,
                          ),
                          onTap: (a, LatLng point) {
                            // Kullanıcının haritada herhangi bir yere dokunması durumunda
                            setState(() {
                              locationData =
                                  LatLng(point.latitude, point.longitude);
                              Log.info(
                                  "Harita tıklandı :${point.latitude},${point.longitude} ");
                            });
                          },
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
                                  locationData.latitude,
                                  locationData.longitude,
                                ),
                                width: 40,
                                height: 40,
                                child: const Icon(
                                  Icons.location_on,
                                  color: Colors.red,
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                          // PolylineLayer(
                          //   polylineCulling: false,
                          //   polylines: [
                          //     Polyline(
                          //       points: [],
                          //       color: Colors.blue,
                          //       strokeWidth: 100,
                          //     ),
                          //   ],
                          // )
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
                  // if (_formKey.currentState!.validate()) {
                  if (_controller.selectedOptions.isNotEmpty) {
                    BaseResponse response =
                        await CustomerBasketService().confirmBasket(
                      locationData.latitude,
                      locationData.longitude,
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
