// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
Future<String> createURL(
  String? baseUrl,
  LatLng? latLong,
) async {
  // concatenate baseURL and latlong lattitude and longitude
  if (latLong == null || baseUrl == null) return "";
  var lat = double.parse(latLong.latitude.toString());
  var lng = double.parse(latLong.longitude.toString());

  return baseUrl + lat.toString() + ',' + lng.toString();
}
