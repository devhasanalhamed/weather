import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/core/enums/request_state.dart';
import 'package:weather/core/enums/weather_scale.dart';
import 'package:weather/location/presentation/controllers/location_provider.dart';
import 'package:weather/weather/presentation/controllers/weather_provider.dart';

class WeatherCard extends StatefulWidget {
  const WeatherCard({super.key});

  @override
  State<WeatherCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  @override
  void initState() {
    Provider.of<WeatherProvider>(context, listen: false).getWeatherByCityName(
      context.read<LocationProvider>().locationModel.cityName,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (_, weatherProvider, __) {
        switch (weatherProvider.weatherRequestState) {
          case RequestState.loading:
            return Center(
              child: CircularProgressIndicator(),
            );
          case RequestState.done:
            final weather = weatherProvider.weatherModel;
            final temp = weatherProvider.temperatureWithScale;
            return Card(
              color: Colors.white24,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          weather.cityName,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    temp,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                  Text(weather.description),
                  Text(weather.main),
                  Text(weather.humidity.toString()),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          weatherProvider
                              .changeWeatherScale(WeatherScale.kelvin);
                        },
                        child: Text("Kelvin"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          weatherProvider
                              .changeWeatherScale(WeatherScale.fahrenheit);
                        },
                        child: Text("Fahrenheit"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          weatherProvider
                              .changeWeatherScale(WeatherScale.celsius);
                        },
                        child: Text("Celsius"),
                      ),
                    ],
                  ),
                ],
              ),
            );
          case RequestState.error:
            return Text("error");
        }
      },
    );
  }
}
