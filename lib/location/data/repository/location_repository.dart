import 'package:weather/location/data/datasource/location_data_source.dart';
import 'package:weather/location/domain/entities/location.dart';
import 'package:weather/location/domain/repository/base_location_repository.dart';

class LocationRepository extends BaseLocationRepository {
  final BaseLocationDataSource baseLocationDataSource;

  LocationRepository({required this.baseLocationDataSource});
  @override
  Future<Location> getLocation() async {
    return await baseLocationDataSource.getLocation();
  }

  @override
  Future<void> setLocation(
      String? cityName, double? latitude, double? longitude) async {
    await baseLocationDataSource.setLocation(cityName, latitude, longitude);
  }
}
