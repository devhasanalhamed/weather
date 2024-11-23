import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:weather/location/data/datasource/location_data_source.dart';
import 'package:weather/location/data/repository/location_repository.dart';
import 'package:weather/location/domain/repository/base_location_repository.dart';
import 'package:weather/location/domain/usecases/get_location.dart';
import 'package:weather/location/domain/usecases/set_location.dart';
import 'package:weather/location/presentation/controllers/location_provider.dart';
import 'package:weather/location/presentation/presentation/location_screen.dart';
import 'package:weather/weather/data/datasource/remote_data_source.dart';
import 'package:weather/weather/data/repository/weather_repository.dart';
import 'package:weather/weather/domain/repository/base_weather_repository.dart';
import 'package:weather/weather/domain/usecase/get_weather_by_city_name.dart';
import 'package:weather/weather/presentation/controllers/weather_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');

  BaseRemoteDataSource baseRemoteDataSource = RemoteDataSource();
  BaseWeatherRepository baseWeatherRepository =
      WeatherRepository(baseRemoteDataSource: baseRemoteDataSource);
  GetWeatherByCityName getWeatherByCityName =
      GetWeatherByCityName(baseWeatherRepository);

  BaseLocationDataSource baseLocationDataSource = LocationDataSource();
  BaseLocationRepository baseLocationRepository =
      LocationRepository(baseLocationDataSource: baseLocationDataSource);
  GetLocationUseCase getLocationUseCase =
      GetLocationUseCase(baseLocationRepository: baseLocationRepository);
  SetLocationUseCase setLocationUseCase =
      SetLocationUseCase(baseLocationRepository: baseLocationRepository);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WeatherProvider(
            getWeatherByCityNameUseCase: getWeatherByCityName,
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => LocationProvider(
            getLocationUseCase: getLocationUseCase,
            setLocationUseCase: setLocationUseCase,
          ),
        ),
      ],
      builder: (context, child) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LocationScreen(),
    );
  }
}
