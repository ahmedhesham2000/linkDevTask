import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';

class ConnectivityManager {
  final Connectivity _connectivity = Connectivity();

  Stream<ConnectivityResult> get onConnectivityChanged =>
      _connectivity.onConnectivityChanged;

  Future<ConnectivityResult?> checkConnectivity() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      return _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      log(e.toString());
      return null;
    }
  }
}