import 'package:location/location.dart';

Future<String> getLocation() async {
  Location location = Location();

  late bool serviceEnabled;
  late PermissionStatus permissionGranted;
  late LocationData locationData;

  serviceEnabled = await location.serviceEnabled();
  if (!serviceEnabled) {
    serviceEnabled = await location.requestService();
    if (!serviceEnabled) {
      return "Can not get location";
    }
  }

  permissionGranted = await location.hasPermission();
  if (permissionGranted == PermissionStatus.denied) {
    permissionGranted = await location.requestPermission();
    if (permissionGranted != PermissionStatus.granted) {
      return "Permission denied";
    }
  }

  locationData = await location.getLocation();
  return "real: ${locationData.isMock}, \nlocation tracking time: ${locationData.time}";
}
