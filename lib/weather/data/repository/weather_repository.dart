import 'package:weather/weather/data/datasource/remote_data_source.dart';
import 'package:weather/weather/domain/entities/weather.dart';
import 'package:weather/weather/domain/repository/base_weather_repository.dart';

class WeatherRepository extends BaseWeatherRepository {
  final BaseRemoteDataSource baseRemoteDataSource;

  WeatherRepository({
    required this.baseRemoteDataSource,
  });

  @override
  Future<Weather> getWeatherByCityName(String cityName) async {
    return await baseRemoteDataSource.getWeatherByCityName(cityName);
  }
}
