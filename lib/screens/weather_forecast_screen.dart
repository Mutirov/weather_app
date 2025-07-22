import 'package:flutter/material.dart';
import 'package:weather_app_ru/api/weather_api.dart';
import 'package:weather_app_ru/model/weather_foracast_daily.dart';
import 'package:weather_app_ru/screens/city_screen.dart';
import 'package:weather_app_ru/widgets/bottom_list_view.dart';
import 'package:weather_app_ru/widgets/city_view.dart';
import 'package:weather_app_ru/widgets/detail_view.dart';
import 'package:weather_app_ru/widgets/temp_view.dart';

class WeatherForecastScreen extends StatefulWidget {
  final WeatherForecast locationWeather;
  const WeatherForecastScreen({required this.locationWeather, super.key});

  @override
  State<WeatherForecastScreen> createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  late Future<WeatherForecast> forecastObject;
  //late String _cityName ;
  String cityName = 'Ashgabat';

  @override
  void initState() {
    super.initState();

    forecastObject = Future.value(widget.locationWeather);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Forecast'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        leading: IconButton(icon: Icon(Icons.my_location),
         onPressed: () {
          setState(() {
            forecastObject = WeatherApi().fetchWeatherForecast();
          });
         }),
        actions: [
          IconButton(
            icon: Icon(Icons.location_city),
            onPressed: () async {
              var tappedName = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CityScreen()),
              );
              if (tappedName != null) {
                setState(() {
                  cityName = tappedName;
                  forecastObject = WeatherApi().fetchWeatherForecast(
                    cityName: cityName, isCity: true
                  );
                });
               // print(_cityName); // consol ciktisi
              }
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          FutureBuilder<WeatherForecast>(
            future: forecastObject,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    SizedBox(height: 50),
                    CityView(snapshot: snapshot),
                    SizedBox(height: 50),
                    TempView(snapshot: snapshot),
                    SizedBox(height: 50),
                    DetailView(snapshot: snapshot),
                    SizedBox(height: 50),
                    BottomListView(snapshot: snapshot),
                  ],
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return Center(child: 
                Text('City not found\nPlease enter a valid city name',
                style: TextStyle(fontSize: 26,) ,));
              }
            },
          ),
        ],
      ),
    );
  }
}
