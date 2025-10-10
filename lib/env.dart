import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract final class Env {
  static String get apiKey => dotenv.env["SPOONTACULAR_API_KEY"]!;
  static String get baseUrl => dotenv.env["SPOONTACULAR_API_BASE_URL"]!;
  static String get search => dotenv.env["RECIPE_COMPLEX_SEARCH_PATH"]!;
  static String get autocomplete => dotenv.env["RECIPE_AUTOCOMPLETE_PATH"]!;
  static String getById(int id) => dotenv.env["RECIPE_SEARCH_BY_ID_PATH"]!.replaceFirst(":id", id.toString());
}