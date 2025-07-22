import 'package:flutter/material.dart';
import 'package:weather_app_ru/utilities/foracast_util.dart';

Widget forecastCard(AsyncSnapshot snapshot, int index) {
  var forecastList = snapshot.data?.list;
  var dayOfWeek = '';
  DateTime date = DateTime.fromMillisecondsSinceEpoch(
    (forecastList?[index].dt.toInt() ?? 0) * 1000,
  );
  var fullDate = Util().getFormattedDate(date);
  dayOfWeek = fullDate.split(',')[0];

  var tempMin = forecastList[index].temp.min.toStringAsFixed(1) ?? '';
  var icon = forecastList[index].getIconUrl();
  var tempMax = forecastList[index].temp.max.toStringAsFixed(1) ?? '';

  return Column(
        children: [
          Text(
            dayOfWeek,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
           SizedBox(height: 6),
          Image.network(icon, width: 48, height: 48),
           SizedBox(height: 6),
          Text(
            'Min: $tempMin°C',
            style: const TextStyle(fontSize: 22, color: Colors.white),
          ),
          const SizedBox(height: 4),
          Text(
            'Max: $tempMax°C',
            style: const TextStyle(fontSize: 22, color: Colors.white),
          ),
        ],
      );
}


/*
Widget forecastCard(AsyncSnapshot snapshot, int index) {
  var forecastList = snapshot.data?.list;
  var dayOfWeek = '';
  DateTime date = DateTime.fromMillisecondsSinceEpoch(
    (forecastList?[index].dt.toInt() ?? 0) * 1000,
  );
  var fullDate = Util().getFormattedDate(date);
  dayOfWeek = fullDate.split(',')[0];

  var tempMin = forecastList[index].temp.min.toStringAsFixed(1) ?? '';
  var icon = forecastList[index].getIconUrl();
  var tempMax = forecastList[index].temp.max.toStringAsFixed(1) ?? '';
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(
        child: Text(
          dayOfWeek,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text('Min', style: TextStyle(fontSize: 16, color: Colors.white)),
              Row(
                children: [
                  Text(
                    '$tempMin C',
                    style: TextStyle(fontSize: 26, color: Colors.white),
                  ),
                  Image.network(icon, scale: 1.2),
                ],
              ),
              Text('Max', style: TextStyle(fontSize: 16, color: Colors.white)),
              Row(
                children: [
                  Text(
                    '$tempMax C',
                    style: TextStyle(fontSize: 26, color: Colors.white),
                  ),
                  Image.network(icon, scale: 1.2),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

*/