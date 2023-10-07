import 'dart:developer';

import 'package:weather/core/utils/constants.dart';
import 'package:weather/data/models/weather_model.dart';
import 'package:dio/dio.dart';

abstract class BaseRemoteDataSource {
  Future<WeatherModel?> getWeatherByCityName(String cityName);
}

class RemoteDataSource implements BaseRemoteDataSource {
  @override
  Future<WeatherModel?> getWeatherByCityName(String cityName) async {
    try {
      var response = await Dio().get(
          '${AppConstants.baseUrl}/weather?q=$cityName&appid=${AppConstants.appKey}');
      log('$response');
      return WeatherModel.fromJson(
        response.data,
      );
      
    } catch (e) {
      log('$e');
      return null;
    }
  }
}
