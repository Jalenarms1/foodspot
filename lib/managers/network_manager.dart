import 'dart:convert';

import 'package:foodspot/models/local_auth.dart';
import 'package:http/http.dart' as http;

class NetworkManager {
  static String apiRoot = "http://localhost:8000";

  static Future<http.Response> get(String urlPath) async {
    final headers = await _getHeaders();
    return http.get(Uri.parse("$apiRoot$urlPath"), headers: headers);
  }

  static Future<http.Response> post(
    String urlPath,
    Map<String, dynamic> data,
  ) async {
    final headers = await _getHeaders();
    return http.post(
      Uri.parse("$apiRoot$urlPath"),
      headers: headers,
      body: jsonEncode(data),
    );
  }

  static Future<Map<String, String>> _getHeaders() async {
    final String? token = await LocalAuth.getToken();
    return {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${token ?? ""}",
    };
  }
}
