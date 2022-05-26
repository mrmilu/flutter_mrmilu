import 'dart:async';

import 'helpers_io.dart' if (dart.library.html) 'helpers_web.dart' as helpers;

class Helpers {
  static String getLocale() {
    return helpers.getLocale();
  }

  /// Modify local debug url when run app in debug mode with Android emulator
  ///
  /// By default isEmulator is [true]
  ///
  /// References: https://stackoverflow.com/questions/5806220/how-to-connect-to-my-http-localhost-web-server-from-android-emulator
  static String getLocalDebugUrl(String baseUrl, {bool isEmulator = true}) {
    return helpers.getLocalDebugUrl(baseUrl, isEmulator: isEmulator);
  }

  /// Show a confirm dialog before close app
  ///
  /// Only avaiable for web
  static StreamSubscription? showConfirmOnCloseApp(String message) {
    return helpers.showConfirmOnCloseApp(message);
  }
}
