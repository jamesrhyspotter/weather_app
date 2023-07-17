// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';

import 'package:hive_flutter/adapters.dart';

class UserRepo {
  Box locationBox = Hive.box('locationBox');
  Box latLongBox = Hive.box('latLonBox');

  updateLocationBox(
      {required String location, required double lat, required double lon}) {
    List locations = locationBox.get('locations', defaultValue: []);

    locations.contains(location)
        ? locations.remove(location)
        : locations.add(location);

    locationBox.put('locations', locations);
    latLongBox.put(location, [lat, lon]);
  }

  getLocations() {
    return locationBox.get('locations', defaultValue: []);
  }

  getLatLong({required String location}) {
    return latLongBox.get(location) ?? [0.0, 0.0];
  }
}
