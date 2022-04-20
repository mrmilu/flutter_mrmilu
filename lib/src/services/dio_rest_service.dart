import 'dart:developer';

import 'package:dio/dio.dart';

/// Abstraction of dio library to Api REST implementations
///
/// Use [baseUrl] to config a base url of api, like `https://api.mrmilu.com`
///
/// Use optional [interceptors] to configure a interceptors list
///
/// Use optional [catchErrors] to get DioError. This is usuful when need
/// transform a DioError to custom error.
class DioRestService {
  final String baseUrl;
  final List<Interceptor> interceptors;
  final void Function(DioError)? catchErrors;
  late Dio _dio;

  DioRestService({
    required this.baseUrl,
    this.interceptors = const [],
    this.catchErrors,
  }) {
    _initClient();
  }

  _initClient() {
    final Dio initDio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveTimeout: 15000,
        connectTimeout: 15000,
        sendTimeout: 15000,
      ),
    );

    if (interceptors.isNotEmpty) {
      initDio.interceptors.addAll(interceptors);
    }
    _dio = initDio;
  }

  Future<T?> get<T>(
    String endpointPath, {
    Map<String, dynamic>? query,
  }) async {
    return await _tryCatch(
      () async {
        final response = await _dio.get<T>(
          endpointPath,
          queryParameters: query,
        );
        return response.data;
      },
    );
  }

  Future<Map<String, dynamic>?> post(
    String endpointPath, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParam,
  }) async {
    return _tryCatch<Map<String, dynamic>>(
      () async {
        final response = await _dio.post<dynamic>(
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

  Future<Map<String, dynamic>?> delete(
    String endpointPath, {
    Map<String, dynamic>? query,
  }) async {
    return _tryCatch<Map<String, dynamic>>(
      () async {
        final response = await _dio.delete<Map<String, dynamic>?>(
          endpointPath,
          data: query,
        );
        return response.data ?? {};
      },
    );
  }

  Future<Map<String, dynamic>?> patch(
    String endpointPath, {
    Map<String, dynamic>? query,
  }) async {
    return _tryCatch<Map<String, dynamic>>(
      () async {
        final response = await _dio.patch<Map<String, dynamic>?>(
          endpointPath,
          data: query,
        );
        return response.data ?? {};
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
