import 'package:flutter/material.dart';
import 'package:weather/core/enums/request_state.dart';
import 'package:weather/core/enums/weather_scale.dart';
import 'package:weather/weather/domain/entities/weather.dart';
import 'package:weather/weather/domain/usecase/get_weather_by_city_name.dart';

class WeatherProvider extends ChangeNotifier {
  final GetWeatherByCityName getWeatherByCityNameUseCase;
  WeatherProvider({
    required this.getWeatherByCityNameUseCase,
  });

  late Weather weatherModel;
  RequestState weatherRequestState = RequestState.loading;
  Future<Weather> getWeatherByCityName(String cityName) async {
    weatherRequestState = RequestState.loading;
    try {
      weatherModel = await getWeatherByCityNameUseCase.execute(cityName);
      weatherRequestState = RequestState.done;
    } catch (error) {
      weatherRequestState = RequestState.error;
    }
    notifyListeners();
    return weatherModel;
  }

  WeatherScale weatherScale = WeatherScale.celsius;
  String get temperatureWithScale {
    if (weatherScale == WeatherScale.kelvin) {
      return "${weatherModel.tempK.toStringAsFixed(1)}K";
    }
    if (weatherScale == WeatherScale.fahrenheit) {
      return "${weatherModel.tempF.toStringAsFixed(1)}°F";
    }
    return "${weatherModel.tempC.toStringAsFixed(1)}°C";
  }

  void changeWeatherScale(WeatherScale scale) {
    if (weatherScale != scale) {
      weatherScale = scale;
      notifyListeners();
    }
  }
}
