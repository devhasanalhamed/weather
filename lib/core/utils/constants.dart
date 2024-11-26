import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants {
  static String baseUrl = dotenv.env['BASE_URL']!;
  static String weatherUrl = '$baseUrl/data/2.5/weather';
  static String locationUrl = '$baseUrl/geo/1.0/direct';
  static String appKey = dotenv.env['API_KEY']!;
}
