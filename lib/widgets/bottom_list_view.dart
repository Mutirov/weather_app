import 'package:flutter/material.dart';
import 'package:weather_app_ru/model/weather_foracast_daily.dart';
import 'package:weather_app_ru/widgets/forecast_cart.dart';

class BottomListView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const BottomListView({required this.snapshot, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '7 Day Weather Forecast',
          style: TextStyle(
            fontSize: 22,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          height: 210,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder:
                (context, index) => SizedBox(width: 8), 
            itemCount: snapshot.data?.list?.length ?? 0,
            itemBuilder:
                (context, index) => Container(
                  width: MediaQuery.of(context).size.width / 2.7,
                  height: 160,
                  color: const Color.fromARGB(221, 67, 179, 249),
                  child: forecastCard(snapshot, index),
                ),
          ),
        ),
      ],
    );
  }
}
