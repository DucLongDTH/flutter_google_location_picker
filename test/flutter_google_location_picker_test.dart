import 'package:flutter/material.dart';
import 'package:flutter_google_location_picker/flutter_google_location_picker.dart';
import 'package:flutter_google_location_picker/model/pick_data_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('added location longitude and latitude for current location', () {
    FlutterGoogleLocationPicker(
        center: LatLong(23, 89),
        onPicked: (pickedData) {
          debugPrint(pickedData.latLong.latitude.toString());
          debugPrint(pickedData.latLong.longitude.toString());
          debugPrint(pickedData.address.toString());
        });
  });
}
