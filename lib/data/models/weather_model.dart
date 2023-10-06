import 'package:weather/domain/entities/weather.dart';

class WeatherModel extends Weather {
  WeatherModel(
    super.id,
    super.cityName,
    super.main,
    super.description,
    super.temp,
    super.pressure,
    super.humidity,
  );

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        json['id'],
        json['name'],
        json['weather'][0]['main'],
        json['weather'][0]['description'],
        json['main']['temp'],
        json['main']['pressure'],
        json['main']['humidity'],
      );
}
