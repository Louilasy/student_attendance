import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthApi {
  static final _auth = LocalAuthentication();

  static Future<bool> hasBiometrics() async {
    try {
      return await _auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      return false;
    }
  }

  static Future<List<BiometricType>> getBiometrics() async {
    try {
      var bios = await _auth.getAvailableBiometrics();
      log(bios.toString());
      return bios;
    } on PlatformException catch (e) {
      return <BiometricType>[];
    }
  }

  static Future<bool> authenticate() async {
    final isAvailable = await hasBiometrics();
    if (!isAvailable) return false;

    try {
      return await _auth.authenticate(
          localizedReason: 'Scan Fingerprint to Authenticate',
          options: AuthenticationOptions(
            useErrorDialogs: true,
            stickyAuth: true,
            biometricOnly: true,
          ));
    } on PlatformException catch (e) {
      return false;
    }
  }
}
