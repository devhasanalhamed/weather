import 'dart:developer';
import 'package:weather/core/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:weather/weather/data/models/weather_model.dart';

abstract class BaseRemoteDataSource {
  Future<WeatherModel> getWeatherByCityName(String cityName);
}

class RemoteDataSource implements BaseRemoteDataSource {
  final dio = Dio();

  @override
  Future<WeatherModel> getWeatherByCityName(String cityName) async {
    try {
      final response = await dio.get(
          "${AppConstants.baseUrl}/weather?q=$cityName&appid=${AppConstants.appKey}");
      log("getWeatherByCityName=> response: $response");
      return WeatherModel.fromJson(response.data);
    } catch (error) {
      log(error.toString());
      // TODO: complete error handling
      rethrow;
    }
  }
}
