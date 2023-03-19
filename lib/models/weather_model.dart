import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;

  WeatherModel({
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherStateName,
  });
//factory Cons
  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    print('temp=${jsonData['avgtemp_c']}');

    return WeatherModel(
      date: data['location']['localtime'],
      temp: jsonData['maxtemp_c'],
      maxTemp: jsonData['maxtemp_c'],
      minTemp: jsonData['mintemp_c'],
      weatherStateName: jsonData['condition']['text'],
    );
  }
  @override
  String toString() {
    return 'tem = $temp minTemp=$minTemp date =$date';
  }

  String getImage() {
    if (weatherStateName == 'Thunderstorm' || weatherStateName == 'Thunder') {
      return 'assets/images/thunderstorm.png';
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return 'assets/images/snow.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemeColor() {
    if (weatherStateName == 'Thunderstorm' || weatherStateName == 'Thunder') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return Colors.blue;
    } else {
      return Colors.orange;
    }
  }
}
