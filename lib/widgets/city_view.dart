import 'package:flutter/material.dart';
import 'package:weather_app_ru/model/weather_foracast_daily.dart';
import 'package:weather_app_ru/utilities/foracast_util.dart';

class CityView extends StatelessWidget {
 
  final AsyncSnapshot<WeatherForecast> snapshot;
  const CityView({required this.snapshot, super.key});

  @override
  Widget build(BuildContext context) {
     var forecastList = snapshot.data?.list;
    var formattedDate = DateTime.fromMillisecondsSinceEpoch(
  (forecastList?[0].dt.toInt() ?? 0) * 1000,
);
    return Column(
      children: [
        Text(
          '${snapshot.data?.city.name ?? ''}, ${snapshot.data?.city.country ?? ''}',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text('${Util().getFormattedDate(formattedDate)}'),
      ],
    );
  }
}
