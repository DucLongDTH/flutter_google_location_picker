import 'package:flutter_google_location_picker/export.dart';

class OSMData {
  final String displayName;
  final AddressModel? address;
  final double lat;
  final double lon;

  OSMData(
      {required this.displayName,
      required this.lat,
      required this.lon,
      required this.address});

  @override
  String toString() {
    return '$displayName, $lat, $lon';
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is OSMData && other.displayName == displayName;
  }

  factory OSMData.fromJson(Map<String, dynamic> json) => OSMData(
      address: json["address"] != null
          ? AddressModel.fromJson(json["address"])
          : null,
      displayName: json['display_name'],
      lat: double.parse(json['lat'] ?? "0.0"),
      lon: double.parse(json['lon'] ?? "0.0"));

  @override
  int get hashCode => Object.hash(displayName, lat, lon);
}
