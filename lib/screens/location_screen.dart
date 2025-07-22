import 'package:flutter/material.dart';
import 'package:weather_app_ru/api/weather_api.dart';
import 'package:weather_app_ru/screens/weather_forecast_screen.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

void getLocationData() async {
  // ignore: unused_local_variable
  var weatherInfo = await WeatherApi().fetchWeatherForecast();

  try {
    var weatherInfo = await WeatherApi().fetchWeatherForecast();
// ignore: use_build_context_synchronously
Navigator.push(context, MaterialPageRoute(builder: (context) {
    return WeatherForecastScreen(locationWeather: weatherInfo);}));
  } catch (e) {
   // print('Error fetching weather data: $e');
    return;
  }
}
 @override
initState(){
  super.initState();
  getLocationData();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.blue,
          strokeWidth: 5.0,
        ),
      ),
    );
  }
}