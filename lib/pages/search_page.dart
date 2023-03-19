import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/services/weather_service.dart';
import 'package:weather_app/providers/weather_provider.dart';

class SearchPage extends StatelessWidget {
  String? cityName;

  VoidCallback? updateUi;
  SearchPage({this.updateUi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: (data) {
              cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;

              WeatherService service = WeatherService();
              WeatherModel? weather =
                  await service.getWeather(cityName: cityName!);

              Provider.of<WeatherProvider>(context, listen: false).weatherDate =
                  weather;
              Provider.of<WeatherProvider>(context, listen: false).cityName =
                  cityName;

              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              label: Text('Search'),
              suffixIcon: GestureDetector(
                onTap: () async {
                  WeatherService service = WeatherService();
                  WeatherModel? weather =
                      await service.getWeather(cityName: cityName!);

                  Provider.of<WeatherProvider>(context, listen: false)
                      .weatherDate = weather;
                  Provider.of<WeatherProvider>(context, listen: false)
                      .cityName = cityName;

                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.search,
                ),
              ),
              border: OutlineInputBorder(),
              hintText: 'Enter City',
            ),
          ),
        ),
      ),
    );
  }
}
