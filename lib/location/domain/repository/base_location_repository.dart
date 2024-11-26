import 'package:weather/location/domain/entities/location.dart';

abstract class BaseLocationRepository {
  Future<Location> getLocation();

  Future<void> setLocation(
    String? cityName,
    double? latitude,
    double? longitude,
  );

  Future<List<Location>> searchLocation(String query);
}
