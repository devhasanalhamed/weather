import 'package:weather/location/domain/entities/location.dart';
import 'package:weather/location/domain/repository/base_location_repository.dart';

class GetLocationUseCase {
  final BaseLocationRepository baseLocationRepository;

  GetLocationUseCase({
    required this.baseLocationRepository,
  });

  Future<Location> execute() async {
    return baseLocationRepository.getLocation();
  }
}
