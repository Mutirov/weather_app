import 'package:flutter/material.dart';
import 'package:weather_app_ru/screens/location_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LocationScreen(),
    );
  }
}


// iphone konumu kapali olabilir. konumu acmak icin ayarlar uygulamasina gitmelisin.