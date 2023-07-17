import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/views/home_page/home_page_view.dart';

late Box locationBox;
late Box latLongBox;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  locationBox = await Hive.openBox('locationBox');
  latLongBox = await Hive.openBox('latLonBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
