import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants {
  static String baseUrl = dotenv.env['BASE_URL']!;
  static String appKey = dotenv.env['API_KEY']!;
}
