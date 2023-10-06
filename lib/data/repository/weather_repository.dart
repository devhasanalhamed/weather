import 'package:weather/data/datasource/remote_datasource.dart';
import 'package:weather/domain/entities/weather.dart';
import 'package:weather/domain/repositroy/base_weather_repository.dart';

class WeatherRepository implements BaseWeatherRepository {
  final BaseRemoteDataSource remoteDataSource;

  WeatherRepository(this.remoteDataSource);

  @override
  Future<Weather> getWeatherByCityName(String cityName) async {
    return (await remoteDataSource.getWeatherByCityName(cityName))!;
  }
}
