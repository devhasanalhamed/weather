import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/location/data/model/location_model.dart';
import 'package:weather/location/domain/entities/location.dart';

abstract class BaseLocationDataSource {
  Future<Location> getLocation();
  Future<void> setLocation(
    String? cityName,
    double? latitude,
    double? longitude,
  );
}

class LocationDataSource implements BaseLocationDataSource {
  @override
  Future<Location> getLocation() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    final city = sharedPreferences.getString("city_name");
    return LocationModel.fromMap({
      "city_name": city,
    });
  }

  @override
  Future<void> setLocation(
      String? cityName, double? latitude, double? longitude) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    await sharedPreferences.setString("city_name", cityName!);
  }
}
