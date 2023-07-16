import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart' as geocoding;

class LocationService {
  Future<LocationData> getLocation() async {
    final location = Location();
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        throw Exception('Location service is disabled.');
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        throw Exception('Location permission is denied.');
      }
    }

    return await location.getLocation();
  }

  Future<String> estimateClosestCity(
      double? latitude, double? longitude) async {
    final placemarks =
        await geocoding.placemarkFromCoordinates(latitude!, longitude!);
    if (placemarks.isNotEmpty) {
      final city = placemarks.first.locality;
      return city ?? 'Unknown';
    }
    return 'Unknown';
  }
}
