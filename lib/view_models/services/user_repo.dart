// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';

import 'package:hive_flutter/adapters.dart';

class UserRepo {
  Box locationBox = Hive.box('locationBox');

  updateLocationBox({required String location}) {
    List locations = locationBox.get('locations', defaultValue: []);

    locations.contains(location)
        ? locations.remove(location)
        : locations.add(location);

    locationBox.put('locations', locations);
  }

  updateLocationBoxFromLocation({required String location}) {
    List locations = locationBox.get('locations', defaultValue: []);

    if (!locations.contains(location)) {
      locations.add(location);
      locationBox.put('locations', locations);
    }
  }

  getLocations() {
    return locationBox.get('locations', defaultValue: []);
  }
}
