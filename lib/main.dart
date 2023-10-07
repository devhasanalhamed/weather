import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/data/datasource/remote_datasource.dart';
import 'package:weather/data/repository/weather_repository.dart';
import 'package:weather/domain/entities/weather.dart';
import 'package:weather/domain/repositroy/base_weather_repository.dart';
import 'package:weather/domain/usecase/get_weather_by_country.dart';

void main() async {
  BaseRemoteDataSource baseRemoteDataSource = RemoteDataSource();
  BaseWeatherRepository baseWeatherRepository =
      WeatherRepository(baseRemoteDataSource);
  Weather weather =
      await GetWeatherByCity(baseWeatherRepository).execute('riyadh');
  runApp(MyApp(weather: weather));
}

class MyApp extends StatelessWidget {
  final Weather weather;
  const MyApp({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.purple,
                Colors.deepPurple,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
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
                      weather.temp.toStringAsFixed(1),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                  ],
                ),
              ),
              Text(weather.description),
              Text(weather.main),
              Text(weather.humidity.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
