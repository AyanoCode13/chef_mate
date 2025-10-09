abstract final class Routes {
  static const String index = "/";
  static const String home = '/home';
  static String recipe(String id) => "/recipe/$id";
  static String cuisine(String cuisine) => "/cuisine/$cuisine";   
}