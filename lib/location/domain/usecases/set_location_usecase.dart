import 'package:weather/location/domain/repository/base_location_repository.dart';

class SetLocationUseCase {
  final BaseLocationRepository baseLocationRepository;

  SetLocationUseCase({
    required this.baseLocationRepository,
  });

  Future<void> execute(
    String? cityName,
    double? latitude,
    double? longitude,
  ) async {
    return baseLocationRepository.setLocation(
      cityName,
      latitude,
      longitude,
    );
  }
}
