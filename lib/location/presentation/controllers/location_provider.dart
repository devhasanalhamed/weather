import 'package:flutter/material.dart';
import 'package:weather/location/data/model/location_model.dart';
import 'package:weather/location/domain/usecases/get_location_usecase.dart';
import 'package:weather/location/domain/usecases/set_location_usecase.dart';

class LocationProvider extends ChangeNotifier {
  final GetLocationUseCase getLocationUseCase;
  final SetLocationUseCase setLocationUseCase;

  LocationProvider({
    required this.getLocationUseCase,
    required this.setLocationUseCase,
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

  List get allCities {
    List tempList = [];
    for (final city in cities) {
      tempList.add(city["city"]);
    }
    return tempList;
  }

  final List cities = [
    {
      "city": "Riyadh",
      "lat": "24.6333",
      "lng": "46.7167",
      "country": "Saudi Arabia",
      "iso2": "SA",
      "admin_name": "Ar Riyāḑ",
      "capital": "primary",
      "population": "7237000",
      "population_proper": "6694000"
    },
    {
      "city": "Jeddah",
      "lat": "21.5433",
      "lng": "39.1728",
      "country": "Saudi Arabia",
      "iso2": "SA",
      "admin_name": "Makkah al Mukarramah",
      "capital": "",
      "population": "4697000",
      "population_proper": "4697000"
    },
    {
      "city": "Mecca",
      "lat": "21.4225",
      "lng": "39.8233",
      "country": "Saudi Arabia",
      "iso2": "SA",
      "admin_name": "Makkah al Mukarramah",
      "capital": "admin",
      "population": "2427924",
      "population_proper": "2427924"
    },
    {
      "city": "Medina",
      "lat": "24.4700",
      "lng": "39.6100",
      "country": "Saudi Arabia",
      "iso2": "SA",
      "admin_name": "Al Madīnah al Munawwarah",
      "capital": "admin",
      "population": "1411599",
      "population_proper": "1411599"
    },
    {
      "city": "Ad Dammām",
      "lat": "26.4333",
      "lng": "50.1000",
      "country": "Saudi Arabia",
      "iso2": "SA",
      "admin_name": "Ash Sharqīyah",
      "capital": "admin",
      "population": "903312",
      "population_proper": "903312"
    },
    {
      "city": "Tabūk",
      "lat": "28.3972",
      "lng": "36.5789",
      "country": "Saudi Arabia",
      "iso2": "SA",
      "admin_name": "Tabūk",
      "capital": "admin",
      "population": "886036",
      "population_proper": "886036"
    },
    {
      "city": "Al Hufūf",
      "lat": "25.3833",
      "lng": "49.5833",
      "country": "Saudi Arabia",
      "iso2": "SA",
      "admin_name": "Ash Sharqīyah",
      "capital": "",
      "population": "660788",
      "population_proper": "660788"
    },
    {
      "city": "Al Qaţīf",
      "lat": "26.5560",
      "lng": "49.9960",
      "country": "Saudi Arabia",
      "iso2": "SA",
      "admin_name": "Ash Sharqīyah",
      "capital": "",
      "population": "625092",
      "population_proper": "625092"
    },
    {
      "city": "Al Ḩillah",
      "lat": "23.4895",
      "lng": "46.7564",
      "country": "Saudi Arabia",
      "iso2": "SA",
      "admin_name": "Ar Riyāḑ",
      "capital": "",
      "population": "594605",
      "population_proper": "594605"
    },
    {
      "city": "Aţ Ţā’if",
      "lat": "21.2751",
      "lng": "40.4062",
      "country": "Saudi Arabia",
      "iso2": "SA",
      "admin_name": "Makkah al Mukarramah",
      "capital": "",
      "population": "579970",
      "population_proper": "579970"
    },
    {
      "city": "Al Jubayl",
      "lat": "27.0000",
      "lng": "49.6544",
      "country": "Saudi Arabia",
      "iso2": "SA",
      "admin_name": "Ash Sharqīyah",
      "capital": "",
      "population": "474679",
      "population_proper": "474679"
    },
    {
      "city": "Buraydah",
      "lat": "26.3333",
      "lng": "43.9667",
      "country": "Saudi Arabia",
      "iso2": "SA",
      "admin_name": "Al Qaşīm",
      "capital": "admin",
      "population": "467410",
      "population_proper": "467410"
    },
    {
      "city": "Ḩafr al Bāţin",
      "lat": "28.4342",
      "lng": "45.9636",
      "country": "Saudi Arabia",
      "iso2": "SA",
      "admin_name": "Ash Sharqīyah",
      "capital": "",
      "population": "387096",
      "population_proper": "387096"
    },
    {
      "city": "Yanbu",
      "lat": "24.0883",
      "lng": "38.0582",
      "country": "Saudi Arabia",
      "iso2": "SA",
      "admin_name": "Al Madīnah al Munawwarah",
      "capital": "",
      "population": "331916",
      "population_proper": "331916"
    },
    {
      "city": "Ḩā’il",
      "lat": "27.5167",
      "lng": "41.6833",
      "country": "Saudi Arabia",
      "iso2": "SA",
      "admin_name": "Ḩā’il",
      "capital": "admin",
      "population": "310897",
      "population_proper": "310897"
    },
    {
      "city": "Abhā",
      "lat": "18.2169",
      "lng": "42.5053",
      "country": "Saudi Arabia",
      "iso2": "SA",
      "admin_name": "‘Asīr",
      "capital": "admin",
      "population": "236157",
      "population_proper": "236157"
    },
    {
      "city": "Sakākā",
      "lat": "29.9697",
      "lng": "40.2000",
      "country": "Saudi Arabia",
      "iso2": "SA",
      "admin_name": "Al Jawf",
      "capital": "admin",
      "population": "204174",
      "population_proper": "204174"
    },
    {
      "city": "Al Qurayyāt",
      "lat": "31.3167",
      "lng": "37.3667",
      "country": "Saudi Arabia",
      "iso2": "SA",
      "admin_name": "Al Jawf",
      "capital": "minor",
      "population": "167080",
      "population_proper": "167080"
    },
    {
      "city": "Jāzān",
      "lat": "16.8892",
      "lng": "42.5611",
      "country": "Saudi Arabia",
      "iso2": "SA",
      "admin_name": "Jāzān",
      "capital": "admin",
      "population": "127743",
      "population_proper": "127743"
    },
    {
      "city": "Najrān",
      "lat": "17.4917",
      "lng": "44.1322",
      "country": "Saudi Arabia",
      "iso2": "SA",
      "admin_name": "Najrān",
      "capital": "admin",
      "population": "72038",
      "population_proper": "72038"
    },
    {
      "city": "Al Wajh",
      "lat": "26.2833",
      "lng": "36.4167",
      "country": "Saudi Arabia",
      "iso2": "SA",
      "admin_name": "Tabūk",
      "capital": "minor",
      "population": "50000",
      "population_proper": "50000"
    },
    {
      "city": "Arar",
      "lat": "30.9753",
      "lng": "41.0231",
      "country": "Saudi Arabia",
      "iso2": "SA",
      "admin_name": "Al Ḩudūd ash Shamālīyah",
      "capital": "admin",
      "population": "27449",
      "population_proper": "27449"
    },
    {
      "city": "Al Bāḩah",
      "lat": "20.0125",
      "lng": "41.4653",
      "country": "Saudi Arabia",
      "iso2": "SA",
      "admin_name": "Al Bāḩah",
      "capital": "admin",
      "population": "21983",
      "population_proper": "21983"
    },
    {
      "city": "Tathlīth",
      "lat": "19.5706",
      "lng": "43.5056",
      "country": "Saudi Arabia",
      "iso2": "SA",
      "admin_name": "‘Asīr",
      "capital": "minor",
      "population": "",
      "population_proper": ""
    }
  ];
}
