import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  // Function to determine the position
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled, return a message
      throw Exception('Location services are disabled.');
    }

    // Check for location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, return a message
        throw Exception('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are permanently denied, handle appropriately
      throw Exception('Location permissions are permanently denied.');
    }

    // When permissions are granted, get the current position
    return await Geolocator.getCurrentPosition(
        locationSettings:
            const LocationSettings(accuracy: LocationAccuracy.high));
  }

  // Get user's current location (latitude and longitude)
  Future<Map<String, double>> getUserLocation() async {
    try {
      Position position = await _determinePosition();
      return {
        "latitude": position.latitude,
        "longitude": position.longitude,
      };
    } catch (e) {
      return {
        "latitude": 30.044420,
        "longitude": 31.235712,
      };
    }
  }

  Future<Map<String, dynamic>> getUserAddress() async {
    Map<String, double> coordinates = await getUserLocation();
    List<Placemark> placemarks = await placemarkFromCoordinates(
        coordinates["latitude"]!, coordinates["longitude"]!);

    if (placemarks.isNotEmpty) {
      Placemark place = placemarks.first;
      return {
        "latitude": coordinates["latitude"],
        "longitude": coordinates["longitude"],
        'location': place.administrativeArea,
      };
    }
    return {
      "latitude": coordinates["latitude"] ?? 30.0444,
      "longitude": coordinates["longitude"] ?? 31.235712,
      'location': "Cairo"
    };
  }
}
