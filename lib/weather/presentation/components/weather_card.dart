import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/weather/domain/entities/weather.dart';
import 'package:weather/weather/presentation/controllers/weather_provider.dart';

class WeatherCard extends StatefulWidget {
  const WeatherCard({super.key});

  @override
  State<WeatherCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  late Future<Weather> weather;

  @override
  void initState() {
    weather = Provider.of<WeatherProvider>(context, listen: false)
        .getWeatherByCityName("riyadh");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: weather,
      builder: (context, snapshot) => Card(
        color: Colors.white24,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    snapshot.data!.cityName,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              snapshot.data!.temp.toStringAsFixed(1),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
