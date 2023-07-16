// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';

// class UserRepo {
//   FirebaseFirestore firestore = FirebaseFirestore.instance;

//   Future<List<String>> fetchLocations() async {
//     CollectionReference collectionRef =
//         firestore.collection('locationCollection');

//     List<String> output = [];

//     try {
//       DocumentSnapshot snapshot = await collectionRef.doc('locations').get();
//       if (snapshot.exists) {
//         Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
//         List<dynamic> locationList = data?['locationNames'] ?? [];
//         output = List<String>.from(locationList);
//       }
//     } catch (e) {}

//     return output;
//   }

//   Future<bool> pushLocation({required String location}) async {
//     CollectionReference collectionRef =
//         firestore.collection('locationCollection');

//     bool output = false;

//     try {
//       collectionRef.doc('locations').update({
//         'locationNames': FieldValue.arrayUnion([location])
//       });
//       output = true;
//     } catch (e) {
//       output = false;
//     }

//     return output;
//   }
// }
