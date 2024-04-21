import 'package:demo/core/log/log.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:location/location.dart';


class LocationManager {
  Future<LocationData?> getLoacation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        Log.error("");
        // EasyLoading.showError(
        //     "Konum alınamadı => konum servisi çalıştırılamadı");
        return null;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        Log.error("Konum alınamadı => izin verilemedi");
        // EasyLoading.showError("Konum alınamadı => izin verilemedi");
        return null;
      }
    }

    locationData = await location.getLocation();
    Log.success(
        "Konum => lat:${locationData.latitude} long: ${locationData.longitude}");
    // EasyLoading.showSuccess(
    //     "Konum => lat:${locationData.latitude} long: ${locationData.longitude}");
    return locationData;
  }
}
