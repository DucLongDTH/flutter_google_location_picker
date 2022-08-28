import 'dart:convert';

import 'package:flutter_google_location_picker/export.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HttpRequestCustom {
  HttpRequestCustom._();

  static Future<http.Response> post(
      {required Client client, required String url}) async {
    var response = await client.post(Uri.parse(url));
    return response;
  }

  static Future<Map<String, dynamic>> requestWithLatLng(
      {required double latitude, required double longitude}) async {
    http.Response response = await post(
        client: http.Client(),
        url:
            "${Config.url}&lat=$latitude&lon=$longitude&zoom=18&addressdetails=1");
    return jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
  }

  static Future<List<dynamic>> requestWithSearch(
      {required Client client, required String search}) async {
    http.Response response = await post(
        client: client,
        url:
            "https://nominatim.openstreetmap.org/search?q=$search&format=json&polygon_geojson=1&addressdetails=1");
    return jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>;
  }
}
