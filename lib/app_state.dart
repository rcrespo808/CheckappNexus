import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _pushNotifications =
        prefs.getBool('ff_pushNotifications') ?? _pushNotifications;
  }

  SharedPreferences prefs;

  bool _pushNotifications = false;
  bool get pushNotifications => _pushNotifications;
  set pushNotifications(bool _value) {
    _pushNotifications = _value;
    prefs.setBool('ff_pushNotifications', _value);
  }
}

LatLng _latLngFromString(String val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
