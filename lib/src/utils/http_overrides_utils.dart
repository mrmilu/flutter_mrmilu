import 'dart:io';

/// Override certificates to avoid bad certificates in mobile devices
///
/// Only available to mobile native platforms (iOS and Android)
class CertificateHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
