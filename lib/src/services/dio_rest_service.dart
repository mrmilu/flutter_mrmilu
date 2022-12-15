import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

/// Abstraction of dio library to Api REST implementations
class DioRestService {
  /// Use [baseUrl] to config a base url of api, like `https://api.mrmilu.com`
  final String baseUrl;

  /// Use optional [interceptors] to configure a interceptors list
  final List<Interceptor> interceptors;

  /// Optional [catchErrors] to get DioError. This is usuful when need
  /// transform a DioError to custom error.
  final void Function(DioError)? catchErrors;

  /// Receive timeout in miliseconds
  ///
  /// By default `15` seconds
  final int receiveTimeout;

  /// Connect timeout in miliseconds
  ///
  /// By default `15` seconds
  final int connectTimeout;

  /// Send timeout in miliseconds
  ///
  /// By default `15` seconds
  final int sendTimeout;

  /// Valid codes to requests
  /// If some code is outside this list, the request will be throw a DioError
  ///
  /// By default `[200]`
  final List<int> validCodes;

  /// Http request headers. The keys of initial headers will be converted to lowercase,
  /// for example 'Content-Type' will be converted to 'content-type'.

  /// The key of Header Map is case-insensitive,
  /// eg: content-type and Content-Type are regard as the same key.
  final Map<String, dynamic>? headers;

  @internal
  late Dio dio;

  DioRestService({
    required this.baseUrl,
    this.interceptors = const [],
    this.catchErrors,
    this.receiveTimeout = 15000,
    this.connectTimeout = 15000,
    this.sendTimeout = 15000,
    this.validCodes = const [200],
    this.headers,
  }) {
    _initClient();
  }

  _initClient() {
    final Dio initDio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveTimeout: receiveTimeout,
        connectTimeout: connectTimeout,
        sendTimeout: sendTimeout,
        headers: headers,
        validateStatus: (int? code) => validCodes.contains(code),
      ),
    );

    if (interceptors.isNotEmpty) {
      initDio.interceptors.addAll(interceptors);
    }
    dio = initDio;
  }

  Future<T?> get<T>(
    String endpointPath, {
    Map<String, dynamic>? queryParam,
  }) async {
    return await _tryCatch(
      () async {
        final response = await dio.get<T>(
          endpointPath,
          queryParameters: queryParam,
        );
        return response.data;
      },
    );
  }

  Future<Map<String, dynamic>?> post(
    String endpointPath, {
    dynamic data,
    Map<String, dynamic>? queryParam,
  }) async {
    return _tryCatch<Map<String, dynamic>>(
      () async {
        final response = await dio.post<dynamic>(
          endpointPath,
          data: data,
          queryParameters: queryParam,
        );
        return response.data != null && response.data is Map
            ? response.data
            : {};
      },
    );
  }

  Future<Map<String, dynamic>?> put(
    String endpointPath, {
    dynamic data,
    Map<String, dynamic>? queryParam,
  }) async {
    return _tryCatch<Map<String, dynamic>>(
      () async {
        final response = await dio.put<dynamic>(
          endpointPath,
          data: data,
          queryParameters: queryParam,
        );
        return response.data != null && response.data is Map
            ? response.data
            : {};
      },
    );
  }

  Future<T?> delete<T>(
    String endpointPath, {
    dynamic data,
    Map<String, dynamic>? queryParam,
  }) async {
    return _tryCatch<T>(
      () async {
        final response = await dio.delete<T>(
          endpointPath,
          data: data,
          queryParameters: queryParam,
        );
        return response.data;
      },
    );
  }

  Future<T?> patch<T>(
    String endpointPath, {
    dynamic data,
    Map<String, dynamic>? queryParam,
  }) async {
    return _tryCatch<T>(
      () async {
        final response = await dio.patch<T>(
          endpointPath,
          data: data,
          queryParameters: queryParam,
        );
        return response.data;
      },
    );
  }

  Future<T?> _tryCatch<T>(
    Future<T?> Function() function,
  ) async {
    try {
      return await function();
    } on DioError catch (e) {
      log('$runtimeType/DioError: ${e.error.toString()}');
      if (catchErrors == null) {
        rethrow;
      }
      catchErrors!(e);
      return null;
    } catch (e) {
      rethrow;
    }
  }
}
