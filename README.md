A flutter plugin helps to search or pick location picker from map. It is completely free and easy to use.

## Features

* Pick location from map
* Search location by places
* Easy to use



## Demo
![flutter_google_location_picker](https://user-images.githubusercontent.com/69592754/174075388-684404cf-ada9-4c44-a1c2-5fc9fcc872ba.png)


<!-- ## Help Maintenance

I've been maintaining quite many repos these days and burning out slowly. If you could help me cheer up, buying me a cup of coffee will make my life really happy and get much energy out of it.

<a href="https://www.buymeacoffee.com/arsarsars1" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/purple_img.png" alt="Buy Me A Coffee" style="height: auto !important;width: auto !important;" ></a> -->

## Objective
This lib was designed to use open street map to set location on Flutter applications for all platforms.

## Getting Started


Import the following package in your dart file

```dart
import 'package:flutter_google_location_picker/flutter_google_location_picker.dart';
```

To use is simple, just call the widget bellow. You need to pass the default center position of the map and a onPicked method to get the picked position from the map.

    FlutterGoogleLocationPicker(
        center: LatLong(23, 89),
        onPicked: (pickedData) {
        })

# Then Usage

Now if you press Set Current Location button, you will get the pinned location by onPicked method.

In the onPicked method you will receive pickedData.

pickedData has two properties.

1. latLong
2. address

latLong has two more properties.

1. latitude
2. longitude

For example

    FlutterGoogleLocationPicker(
        center: LatLong(23, 89),
        onPicked: (pickedData) {
           print(pickedData.latLong.latitude);
           print(pickedData.latLong.longitude);
           print(pickedData.address);
        })

You can get latitude, longitude and address like that.

If you want tools to zoom in and out just use the following example


    FlutterGoogleLocationPicker(
        showZoomButtons: true,
        center: LatLong(23, 89),
        onPicked: (pickedData) {
           print(pickedData.latLong.latitude);
           print(pickedData.latLong.longitude);
           print(pickedData.address);
        })

You wil get the Map tools to handle the Ui accordingly.