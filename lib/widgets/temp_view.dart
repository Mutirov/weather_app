import 'package:flutter/material.dart';

class TempView extends StatelessWidget {
  final AsyncSnapshot snapshot;
  const TempView({required this.snapshot, super.key});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data?.list;
    var icon = forecastList?[0].getIconUrl();
    var temp = forecastList?[0].temp.day.toStringAsFixed(0);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(icon, scale: 0.5),
        SizedBox(width: 20),
        Column(
          children: [
            Text(
              '$temp C',
              style: TextStyle(
                fontSize: 54,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              '${forecastList?[0].weather[0].description}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
