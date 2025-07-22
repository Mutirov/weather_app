import 'package:geolocator/geolocator.dart';

class Location {
  double? latidtude;
  double? longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: Duration(seconds: 15),
        ),
      );
      latidtude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      throw Exception('Something went wrong $e');
    }
  }
}
