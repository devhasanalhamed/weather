import 'package:weather/location/domain/entities/location.dart';

class LocationModel extends Location {
  LocationModel({
    required super.cityName,
    required super.latitude,
    required super.longitude,
  });

  factory LocationModel.fromMap(Map<String, dynamic> map) => LocationModel(
        cityName: map["city_name"] ?? "unknown",
        latitude: map["latitude"] ?? 0,
        longitude: map["longitude"] ?? 0,
      );

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        cityName: json["name"] ?? "unknown",
        latitude: json["lat"] ?? 0,
        longitude: json["lon"] ?? 0,
      );
}
