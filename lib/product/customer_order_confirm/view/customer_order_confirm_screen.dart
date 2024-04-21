import 'package:auto_route/auto_route.dart';
import 'package:demo/core/extension/screen_size.dart';
import 'package:demo/core/location/location_manager.dart';
import 'package:demo/core/log/log.dart';
import 'package:demo/core/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

@RoutePage()
class CustomerOrderConfirmScreen extends StatefulWidget {
  const CustomerOrderConfirmScreen({super.key});
  @override
  State<CustomerOrderConfirmScreen> createState() =>
      _CustomerOrderConfirmScreenState();
}

class _CustomerOrderConfirmScreenState
    extends State<CustomerOrderConfirmScreen> {
  LocationData? locationData;
  LatLng initialLocationData = const LatLng(36.886857, 30.7030818);
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((value) async {
      setState(() {
        Future.delayed(const Duration(seconds: 1)).then((value) async {
          locationData = await LocationManager().getLoacation();
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sipariş Tamamlama")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                  "Konum => lat:${locationData?.latitude} long:${locationData?.longitude}"),
              Form(
                child: Column(
                  children: [
                    const TextField(
                      decoration: InputDecoration(
                        hintText: "Notunuz var mı? (varsa)",
                      ),
                      minLines: 2,
                      maxLines: 3,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 50.0),
                      child: Text("Konum al bu alanda (bölge seç + haritadan)"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          Future.delayed(Duration.zero).then((value) async {
                            locationData =
                                await LocationManager().getLoacation();
                          });
                        });
                        EasyLoading.showSuccess(
                            "Konum => lat:${locationData?.latitude} long:${locationData?.longitude}");
                        Log.info("Konum al tıklandı");
                      },
                      child: const Text("konum al"),
                    ),
                    SizedBox(
                      height: 300,
                      width: context.width,
                      child: Visibility(
                        visible: true,
                        child: FlutterMap(
                          options: MapOptions(
                            initialCenter: LatLng(
                              locationData?.latitude ??
                                  initialLocationData.latitude,
                              locationData?.longitude ??
                                  initialLocationData.longitude,
                            ),
                          ),
                          children: [
                            TileLayer(
                              minZoom: 8,
                              urlTemplate:
                                  'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                              userAgentPackageName: 'com.example.app',
                            ),
                            MarkerLayer(
                              markers: [
                                Marker(
                                  point: LatLng(
                                    locationData?.latitude ??
                                        initialLocationData.latitude,
                                    locationData?.longitude ??
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
                onTap: () {
                  EasyLoading.showSuccess(
                      "İşlem tamamladı.Sipariş alındığında bilgilendirme yapılacaktır !");
                  context.navigateNamedTo(RouterItem.customerOrderSucces.str());
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
