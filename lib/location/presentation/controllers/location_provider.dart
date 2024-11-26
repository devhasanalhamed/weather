import 'package:flutter/material.dart';
import 'package:weather/location/data/model/location_model.dart';
import 'package:weather/location/domain/usecases/get_location_usecase.dart';
import 'package:weather/location/domain/usecases/search_location_usecase.dart';
import 'package:weather/location/domain/usecases/set_location_usecase.dart';

class LocationProvider extends ChangeNotifier {
  final GetLocationUseCase getLocationUseCase;
  final SetLocationUseCase setLocationUseCase;
  final SearchLocationUsecase searchLocationUsecase;

  LocationProvider({
    required this.getLocationUseCase,
    required this.setLocationUseCase,
    required this.searchLocationUsecase,
  });

  Future<void> setLocation(
    String? cityName,
    double? latitude,
    double? longitude,
  ) async {
    await setLocationUseCase.execute(
      cityName,
      latitude,
      longitude,
    );

    getLocation();
  }

  late LocationModel locationModel;
  Future<LocationModel> getLocation() async {
    locationModel = await getLocationUseCase.execute() as LocationModel;
    return locationModel;
  }

  List<LocationModel> cities = [];

  Future<List<LocationModel>> searchLocation(String query) async {
    final result =
        await searchLocationUsecase.execute(query) as List<LocationModel>;
    cities = result;
    notifyListeners();
    return result;
  }
}
