import 'package:flutter/material.dart';
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
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                weather.cityName,
                textAlign: TextAlign.center,
              ),
              Text(weather.description),
              Text(weather.main),
              Text(weather.temp.toString()),
              Text(weather.humidity.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
