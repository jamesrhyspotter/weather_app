import 'package:flutter/material.dart';

import 'package:weather_app/view_models/services/weather_api_service.dart';
import 'package:weather_app/views/home_page/home_page_view.dart';

import 'firebase_options.dart';
// import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );

    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePageView(),
    );
  }
}