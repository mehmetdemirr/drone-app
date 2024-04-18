import 'package:demo/product/company_order_detail/widget/myInput.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';

class FlutterMapExample extends StatefulWidget {
  const FlutterMapExample({super.key});

  @override
  State<FlutterMapExample> createState() => _FlutterMapExampleState();
}

class _FlutterMapExampleState extends State<FlutterMapExample> {
  final start = TextEditingController(
      text: "Kadriye, Celal Bayar Cad No:5-6, 07525 Serik/Antalya");
  final end =
      TextEditingController(text: "Merkez, 2026. Sk., 07500 Serik/Antalya");
  bool isVisible = false;
  List<LatLng> routpoints = [const LatLng(52.05884, -1.345583)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                MyInput(controler: start, hint: 'Enter Starting PostCode'),
                const SizedBox(
                  height: 15,
                ),
                MyInput(controler: end, hint: 'Enter Ending PostCode'),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[500]),
                    onPressed: () async {
                      List<Location> startL =
                          await locationFromAddress(start.text);
                      List<Location> endL = await locationFromAddress(end.text);

                      var v1 = startL[0].latitude;
                      var v2 = startL[0].longitude;
                      var v3 = endL[0].latitude;
                      var v4 = endL[0].longitude;

                      var url =
                          'http://router.project-osrm.org/route/v1/driving/$v2,$v1;$v4,$v3?steps=true&annotations=true&geometries=geojson&overview=full';
                      var response = await Dio().get(url);
                      print(response.data);
                      setState(() {
                        routpoints = [];
                        var ruter = response.data['routes'][0]['geometry']
                            ['coordinates'];
                        for (int i = 0; i < ruter.length; i++) {
                          var reep = ruter[i].toString();
                          reep = reep.replaceAll("[", "");
                          reep = reep.replaceAll("]", "");
                          var lat1 = reep.split(',');
                          var long1 = reep.split(",");
                          routpoints.add(LatLng(
                              double.parse(lat1[1]), double.parse(long1[0])));
                        }
                        isVisible = !isVisible;
                        print(routpoints);
                      });
                    },
                    child: const Text('Press')),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 500,
                  width: 400,
                  child: Visibility(
                    visible: isVisible,
                    child: FlutterMap(
                      options: MapOptions(
                        center: routpoints[0],
                        zoom: 10,
                      ),
                      // nonRotatedChildren: [
                      //   AttributionWidget.defaultWidget(
                      //       source: 'OpenStreetMap contributors',
                      //       onSourceTapped: null),
                      // ],
                      children: [
                        TileLayer(
                          urlTemplate:
                              'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                          userAgentPackageName: 'com.example.app',
                        ),
                        PolylineLayer(
                          polylineCulling: false,
                          polylines: [
                            Polyline(
                                points: routpoints,
                                color: Colors.blue,
                                strokeWidth: 9)
                          ],
                        )
                      ],
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
