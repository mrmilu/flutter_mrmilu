// Can be ignore this warning because the files that use this helper, use conditional import
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html show window, BeforeUnloadEvent;
import 'dart:async';

String getLocale() {
  return html.window.navigator.language;
}

String getLocalDebugUrl(String baseUrl, {bool isEmulator = false}) {
  return baseUrl;
}

StreamSubscription? showConfirmOnCloseApp(String message) {
  return html.window.onBeforeUnload.listen((event) {
    (event as html.BeforeUnloadEvent).returnValue = message;
    html.window.confirm(message);
  });
}
