import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_google_location_picker/export.dart';
import 'package:http/http.dart';

class RequestService {
  RequestService._privateConstructor();

  static final RequestService _instance = RequestService._privateConstructor();

  factory RequestService() {
    return _instance;
  }

  initState(Function() onNotifyFunction) {
    _onNotify = onNotifyFunction;
  }

  Function()? _onNotify;

  void notifyListener() {
    _onNotify?.call();
  }

  Future<String> requestLocationName(
      {required double latitude, required double longitude}) async {
    Map<String, dynamic> decodedResponse =
        await HttpRequestCustom.requestWithLatLng(
            latitude: latitude, longitude: longitude);
    notifyListener();

    return await RequestService.checkInternet() == true
        ? decodedResponse['display_name'] ?? "MOVE TO CURRENT POSITION"
        : "Check your connection";
  }

  Future<List<OSMData>> requestSearch(
      {required Client client, required String search}) async {
    var response = await HttpRequestCustom.requestWithSearch(
        client: client, search: search);
    notifyListener();
    if (response.isNotEmpty) {
      return response.map((e) => OSMData.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<PickedData> pickData(
      {required double latitude, required double longitude}) async {
    LatLong latLong = LatLong(latitude: latitude, longitude: longitude);

    Map<String, dynamic> decodedResponse =
        await HttpRequestCustom.requestWithLatLng(
            latitude: latLong.latitude, longitude: latLong.longitude);
    notifyListener();
    PickedData pickedData = PickedData.fromJson(decodedResponse, latLong);
    String postCode = "";
    String country = "";
    List<String> values = [];
    try {
      values = pickedData.displayName.split(",");
      if (pickedData.address!.postCode.isNotNullOrEmpty()) {
        postCode = pickedData.address!.postCode;
      } else {
        for (var element in values) {
          if (element.trim().isZip5Code()) {
            postCode = element.trim();
          }
        }
        pickedData.address!.postCode = postCode;
      }
    } catch (e) {
      country = "";
    }
    try {
      if (pickedData.address!.country.isNotNullOrEmpty()) {
        country = pickedData.address!.country;
      } else {
        if (values.isNotEmpty) {
          country = values.last.trim();
        }
        pickedData.address!.country = country;
      }
    } catch (e) {
      country = "";
    }
    return pickedData;
  }

  static Future<bool> checkInternet() async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      return false;
    }
  }
}
