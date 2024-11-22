import 'package:weather/weather/domain/entities/weather.dart';

class WeatherModel extends Weather {
  WeatherModel({
    required super.id,
    required super.cityName,
    required super.main,
    required super.description,
    required super.tempK,
    required super.tempF,
    required super.tempC,
    required super.pressure,
    required super.humidity,
    required super.longitude,
    required super.latitude,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        id: json["id"],
        cityName: json["name"],
        main: json["weather"][0]["main"],
        description: json["weather"][0]["description"],
        tempK: json["main"]["temp"],
        tempF: (json["main"]["temp"] - 273.15) * 9 / 5 + 32,
        tempC: (json["main"]["temp"] - 273.15),
        pressure: json["main"]["pressure"],
        humidity: json["main"]["humidity"],
        longitude: json["coord"]["lon"],
        latitude: json["coord"]["lat"],
      );
}
