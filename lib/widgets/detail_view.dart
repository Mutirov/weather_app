import 'package:flutter/material.dart';
import 'package:weather_app_ru/model/weather_foracast_daily.dart';
import 'package:weather_app_ru/utilities/foracast_util.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const DetailView({required this.snapshot, super.key});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data?.list;
    var pressure = (forecastList != null && forecastList.isNotEmpty)
        ? forecastList[0].pressure * 0.750062
        : 0.0;
    var humidity = (forecastList != null && forecastList.isNotEmpty)
        ? forecastList[0].humidity
        : 0;
    var wind = (forecastList != null && forecastList.isNotEmpty)
        ? forecastList[0].speed
        : 0.0;
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
          // ignore: deprecated_member_use
          Util.getItem(FontAwesomeIcons.thermometerThreeQuarters, pressure.round(), 'mm Hg'),
          Util.getItem(FontAwesomeIcons.cloudRain, humidity, '%'),
          Util.getItem(FontAwesomeIcons.wind, wind.toInt(), 'm/s')
      ],
    );
  }
}
