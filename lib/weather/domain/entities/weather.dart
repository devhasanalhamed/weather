class Weather {
  final int id;
  final String cityName;
  final String main;
  final String description;
  final double temp;
  final int pressure;
  final int humidity;
  final double longitude;
  final double latitude;

  Weather({
    required this.id,
    required this.cityName,
    required this.main,
    required this.description,
    required this.temp,
    required this.pressure,
    required this.humidity,
    required this.longitude,
    required this.latitude,
  });
}
