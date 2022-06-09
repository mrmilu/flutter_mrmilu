import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';

String getLocale() {
  return Platform.localeName;
}

String getLocalDebugUrl(String baseUrl, {bool isEmulator = true}) {
  return Platform.isAndroid && kDebugMode && isEmulator
      ? 'https://10.0.2.2/'
      : baseUrl;
}

StreamSubscription? showConfirmOnCloseApp(String message) {
  throw 'Unimplement in this platform';
}
