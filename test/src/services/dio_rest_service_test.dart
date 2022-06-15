import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_mrmilu/flutter_mrmilu.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() async {
  const baseUrl = 'https://mrmilu.com';
  late DioRestService dioRest;
  late DioAdapter dioAdapter;
  late DioRestService dioRestValidCodes;
  late DioAdapter dioAdapterValidCodes;
  setUp(() {
    dioRest = DioRestService(baseUrl: baseUrl);
    dioAdapter = DioAdapter(dio: dioRest.dio);
    dioRestValidCodes = DioRestService(baseUrl: baseUrl, validCodes: [201]);
    dioAdapterValidCodes = DioAdapter(dio: dioRestValidCodes.dio);
  });
  group('change valid codes -', () {
    test('success', () async {
      dioAdapterValidCodes.onGet(
        '',
        (server) => server.reply(
          201,
          {'message': 'success'},
        ),
      );
      final response = await dioRestValidCodes.get<Map<String, dynamic>?>('');

      expect(() async => await dioRestValidCodes.get<Map<String, dynamic>?>(''),
          returnsNormally);
      expect(response != null, true);
      expect(response!.isEmpty, false);
      expect(response['message'], 'success');
    });

    test('error', () {
      dioAdapterValidCodes.onGet(
        '',
        (server) => server.reply(
          200,
          {'message': 'error'},
        ),
      );

      expect(() async => await dioRestValidCodes.get<Map<String, dynamic>?>(''),
          throwsA(isA<DioError>()));
    });
  });
  group('get -', () {
    test('success', () async {
      dioAdapter.onGet(
        '',
        (server) => server.reply(
          200,
          {'message': 'success'},
        ),
      );

      final response = await dioRest.get<Map<String, dynamic>?>('');

      expect(() async => await dioRest.get<Map<String, dynamic>?>(''),
          returnsNormally);
      expect(response != null, true);
      expect(response!.isEmpty, false);
      expect(response['message'], 'success');
    });
    test('error', () async {
      dioAdapter.onGet(
        '',
        (server) => server.reply(
          201,
          {'message': 'error'},
        ),
      );

      expect(() async => await dioRest.get<Map<String, dynamic>?>(''),
          throwsA(isA<DioError>()));
    });
  });
  group('post -', () {
    test('success', () async {
      dioAdapter.onPost(
        '',
        (server) => server.reply(
          200,
          {'message': 'success'},
        ),
      );

      final response = await dioRest.post('');

      expect(() async => await dioRest.post(''), returnsNormally);
      expect(response != null, true);
      expect(response!.isEmpty, false);
      expect(response['message'], 'success');
    });
    test('error', () async {
      dioAdapter.onPost(
        '',
        (server) => server.reply(
          201,
          {'message': 'error'},
        ),
      );

      expect(() async => await dioRest.post(''), throwsA(isA<DioError>()));
    });
  });
  group('delete -', () {
    test('success', () async {
      dioAdapter.onDelete(
        '',
        (server) => server.reply(
          200,
          {'message': 'success'},
        ),
      );

      final response = await dioRest.delete('');

      expect(() async => await dioRest.delete(''), returnsNormally);
      expect(response != null, true);
      expect(response!.isEmpty, false);
      expect(response['message'], 'success');
    });
    test('error', () async {
      dioAdapter.onDelete(
        '',
        (server) => server.reply(
          201,
          {'message': 'error'},
        ),
      );

      expect(() async => await dioRest.delete(''), throwsA(isA<DioError>()));
    });
  });
  group('patch -', () {
    test('success', () async {
      dioAdapter.onPatch(
        '',
        (server) => server.reply(
          200,
          {'message': 'success'},
        ),
      );

      final response = await dioRest.patch('');

      expect(() async => await dioRest.patch(''), returnsNormally);
      expect(response != null, true);
      expect(response!.isEmpty, false);
      expect(response['message'], 'success');
    });
    test('error', () async {
      dioAdapter.onPatch(
        '',
        (server) => server.reply(
          201,
          {'message': 'error'},
        ),
      );

      expect(() async => await dioRest.patch(''), throwsA(isA<DioError>()));
    });
  });
}
