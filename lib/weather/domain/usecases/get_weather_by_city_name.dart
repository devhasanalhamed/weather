import 'package:weather/weather/domain/entities/weather.dart';
import 'package:weather/weather/domain/repository/base_weather_repository.dart';

final class GetWeatherByCityName {
  final BaseWeatherRepository baseWeatherRepository;

  GetWeatherByCityName(
    this.baseWeatherRepository,
  );

  Future<Weather> execute(String cityName) async {
    return await baseWeatherRepository.getWeatherByCityName(cityName);
  }
}
