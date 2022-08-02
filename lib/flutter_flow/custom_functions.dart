import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

int calculateDistance(
  LatLng? pointOne,
  LatLng? pointTwo,
) {
  // return distance as if in plane in kilometers
  int distanceInKms = 0;
  double earthsRadious = 6371;
  double errorMargin = 1.02;

  if (pointOne == null || pointTwo == null || pointOne == pointTwo) {
    return 0;
  }

  double distLat = (pointOne.latitude - pointTwo.latitude) *
      double.parse((math.pi / 180).toStringAsFixed(6));
  double distLon = (pointOne.longitude - pointTwo.longitude) *
      double.parse((math.pi / 180).toStringAsFixed(6));

  double a = math.sin(distLat / 2) * math.sin(distLat / 2) +
      math.cos(pointOne.latitude * (math.pi / 180)) *
          math.cos(pointTwo.latitude * (math.pi / 180)) *
          math.sin(distLon / 2) *
          math.sin(distLon / 2);

  double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
  distanceInKms = (earthsRadious * errorMargin * c).round();

  return distanceInKms;
}

String latlongtostring(LatLng? latlon) {
  // convert laton to string show 4 decimals
  if (latlon == null) return "";
  var result = '';
  result += latlon.latitude.toStringAsFixed(6);
  result += ' , ' + latlon.longitude.toStringAsFixed(6);
  return result;
}
