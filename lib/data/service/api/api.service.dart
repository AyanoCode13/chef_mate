import 'dart:convert';
import 'dart:isolate';
import 'package:http/http.dart' as http;

abstract class ApiService {
  final String _apiKey;
  final String _baseUrl;
  late Map<String, String>? _headers;

  ApiService({required String apiKey, required String baseUrl})
    : _apiKey = apiKey,
      _baseUrl = baseUrl {
    _headers = {'X-API-KEY': _apiKey, 'Content-Type': 'application/json'};
  }

  void setHeaders ({ required Map<String, String>? headers}){
    _headers = headers;
  }

  Future<dynamic> sendRequest({
    required String path,
    Map<String, dynamic>? query,
  }) async {
    try {
      final res = await http.get(
        _formatUri(path: path, query: query),
        headers: _headers,
      );
      if (res.statusCode == 200) {
        return await _decodeJSON(data: res.body);
      }
      return null;
    } on Exception catch (e) {
      print(e);
    }
  }

  Future _decodeJSON({required String data}) async {
    return await Isolate.run(() {
      return json.decode(data);
    });
  }

  Uri _formatUri({required String path, Map<String, dynamic>? query}) {
    return Uri.https(_baseUrl, path, query);
  }
}
