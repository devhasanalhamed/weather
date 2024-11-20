import 'package:flutter/material.dart';
import 'package:weather/weather/data/datasource/remote_data_source.dart';
import 'package:weather/weather/data/repository/weather_repository.dart';
import 'package:weather/weather/domain/entities/weather.dart';
import 'package:weather/weather/domain/repository/base_weather_repository.dart';
import 'package:weather/weather/domain/usecase/get_weather_by_city_name.dart';

class WeatherProvider extends ChangeNotifier {
  late BaseRemoteDataSource baseRemoteDataSource;
  late BaseWeatherRepository baseWeatherRepository;

  WeatherProvider() {
    initialize();
  }

  Future<void> initialize() async {
    baseRemoteDataSource = RemoteDataSource();
    baseWeatherRepository =
        WeatherRepository(baseRemoteDataSource: baseRemoteDataSource);
  }

  Future<Weather> getWeatherByCityName(String cityName) async {
    return await GetWeatherByCityName(baseWeatherRepository).execute("riyadh");
  }
}
