import 'package:weather/domain/entities/weather.dart';
import 'package:weather/domain/repositroy/base_weather_repository.dart';

class GetWeatherByCity {
  final BaseWeatherRepository repository;

  GetWeatherByCity(this.repository);

  Future<Weather> execute(String cityName) async {
    return await repository.getWeatherByCityName(cityName);
  }
}
