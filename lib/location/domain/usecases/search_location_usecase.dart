import 'package:weather/location/domain/entities/location.dart';
import 'package:weather/location/domain/repository/base_location_repository.dart';

class SearchLocationUsecase {
  final BaseLocationRepository baseLocationRepository;

  SearchLocationUsecase({
    required this.baseLocationRepository,
  });

  Future<List<Location>> execute(String query) async {
    return await baseLocationRepository.searchLocation(query);
  }
}
