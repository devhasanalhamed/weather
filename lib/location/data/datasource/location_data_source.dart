import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/core/utils/constants.dart';
import 'package:weather/location/data/model/location_model.dart';
import 'package:weather/location/domain/entities/location.dart';

abstract class BaseLocationDataSource {
  Future<Location> getLocation();

  Future<void> setLocation(
    String? cityName,
    double? latitude,
    double? longitude,
  );

  Future<List<LocationModel>> searchLocation(String query);
}

class LocationDataSource implements BaseLocationDataSource {
  final dio = Dio();

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

  @override
  Future<List<LocationModel>> searchLocation(String query) async {
    final limit = 5;
    try {
      final result = await dio.get(
          '${AppConstants.locationUrl}?q=$query&limit=$limit&appid=${AppConstants.appKey}');
      if (result.data != null) {
        print(result.data);
        List<LocationModel> cities = [];
        for (var city in result.data) {
          cities.add(LocationModel.fromJson(city));
        }
        return cities;
      }
      throw 'search location not find result';
    } catch (error) {
      throw 'search location';
    }
  }
}
