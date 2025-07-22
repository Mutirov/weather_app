import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Util {
  getFormattedDate(DateTime dateTime) {
    return DateFormat('EEE, MMMM d, y').format(dateTime);
  }

  static getItem(IconData iconData, int value, String units) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(iconData, size: 28, color: Colors.black87),
        const SizedBox(height: 10),
        Text(
          '$value',
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black87,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          units,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
