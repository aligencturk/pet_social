import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'config.dart';

class ApiClient {
  ApiClient({http.Client? httpClient, Logger? logger})
    : _client = httpClient ?? http.Client(),
      _logger = logger ?? Logger();

  static const String baseUrl = 'https://api.rivorya.com/petsocial/';

  final http.Client _client;
  final Logger _logger;

  Uri _buildUri(String path) {
    return Uri.parse('$baseUrl$path');
  }

  Future<Map<String, dynamic>> postJson(
    String path,
    Map<String, dynamic> body, {
    Map<String, String>? headers,
  }) async {
    final uri = _buildUri(path);
    final mergedHeaders = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization':
          'Basic ' +
          base64Encode(
            utf8.encode(basicAuthUsername + ':' + basicAuthPassword),
          ),
      ...?headers,
    };

    _logger.i('POST ' + uri.toString());
    _logger.d(body);
    final response = await _client
        .post(uri, headers: mergedHeaders, body: jsonEncode(body))
        .timeout(const Duration(seconds: 20));

    _logger.i('RESP ' + response.statusCode.toString());
    _logger.d(response.body);

    final decoded = jsonDecode(response.body);
    if (decoded is Map<String, dynamic>) {
      return decoded;
    }
    throw const FormatException('Unexpected response format');
  }
}
