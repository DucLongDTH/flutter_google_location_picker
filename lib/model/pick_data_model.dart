import 'package:flutter_google_location_picker/export.dart';

class PickedData {
  PickedData(
      {required this.placeId,
      required this.lat,
      required this.lon,
      required this.latLong,
      required this.displayName,
      this.address});

  int placeId;
  double lat;
  double lon;
  LatLong latLong;
  String displayName;
  AddressModel? address;

  factory PickedData.fromJson(Map<String, dynamic> json, LatLong latLong) =>
      PickedData(
          placeId: json["place_id"] ?? 0,
          lat: json["lat"] ?? 0.0,
          lon: json["lon"] ?? 0.0,
          latLong: latLong,
          displayName: json["display_name"] ?? "",
          address: json["address"] != null
              ? AddressModel.fromJson(json["address"])
              : null);

  Map<String, dynamic> toJson() => {
        "place_id": placeId,
        "lat": lat,
        "lon": lon,
        "display_name": displayName,
        "address": address?.toJson(),
      };
}
