import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tractian_test/core/services/http/http_service.dart';

class DioMock extends Mock implements Dio {}

void main() {
  late HttpServiceImp httpServiceImp;
  late Dio dio;

  setUp(() {
    dio = DioMock();
    httpServiceImp = HttpServiceImp.test(dio);
  });

  group(
    'GET method | ',
    () {
      test(
        'should return a success response in get method',
        () async {
          when(() => dio.get(any())).thenAnswer(
            (_) async => Response(
                requestOptions: RequestOptions(),
                data: 'teste',
                statusCode: 200),
          );

          final response = await httpServiceImp.get('/any-url');

          expect(response!.statusCode, 200);
          expect(response.data, 'teste');
        },
      );

      test(
        'should return a DioException response in get method',
        () async {
          when(() => dio.get(any())).thenThrow(
            DioException(requestOptions: RequestOptions()),
          );

          final response = await httpServiceImp.get('/any-url');

          expect(response, isNull);
        },
      );
    },
  );

  group(
    'POST method | ',
    () {
      test(
        'should return a success response in post method',
        () async {
          when(() => dio.post(any(), data: {})).thenAnswer(
            (_) async => Response(
                requestOptions: RequestOptions(),
                data: 'teste',
                statusCode: 201),
          );

          final response = await httpServiceImp.post('/any-url', {});

          expect(response!.statusCode, 201);
          expect(response.data, 'teste');
        },
      );

      test(
        'should return a DioException response in post method',
        () async {
          when(() => dio.post(any(), data: {})).thenThrow(
            DioException(requestOptions: RequestOptions()),
          );

          final response = await httpServiceImp.post('/any-url', {});

          expect(response, isNull);
        },
      );
    },
  );

  group(
    'PUT method | ',
    () {
      test(
        'should return a success response in PUT method',
        () async {
          when(() => dio.put(any(), data: {})).thenAnswer(
            (_) async => Response(
                requestOptions: RequestOptions(),
                data: 'teste',
                statusCode: 200),
          );

          final response = await httpServiceImp.put('/any-url', {});

          expect(response!.statusCode, 200);
          expect(response.data, 'teste');
        },
      );

      test(
        'should return a DioException response in PUT method',
        () async {
          when(() => dio.put(any(), data: {})).thenThrow(
            DioException(requestOptions: RequestOptions()),
          );

          final response = await httpServiceImp.put('/any-url', {});

          expect(response, isNull);
        },
      );
    },
  );

  group(
    'DELETE method | ',
    () {
      test(
        'should return a success response in DELETE method',
        () async {
          when(() => dio.delete(any(), data: {})).thenAnswer(
            (_) async => Response(
                requestOptions: RequestOptions(),
                data: 'teste',
                statusCode: 200),
          );

          final response = await httpServiceImp.delete('/any-url', {});

          expect(response!.statusCode, 200);
          expect(response.data, 'teste');
        },
      );

      test(
        'should return a DioException response in DELETE method',
        () async {
          when(() => dio.delete(any(), data: {})).thenThrow(
            DioException(requestOptions: RequestOptions()),
          );

          final response = await httpServiceImp.delete('/any-url', {});

          expect(response, isNull);
        },
      );
    },
  );

  group(
    'PATCH method | ',
    () {
      test(
        'should return a success response in PATCH method',
        () async {
          when(() => dio.patch(any(), data: {})).thenAnswer(
            (_) async => Response(
                requestOptions: RequestOptions(),
                data: 'teste',
                statusCode: 200),
          );

          final response = await httpServiceImp.patch('/any-url', {});

          expect(response!.statusCode, 200);
          expect(response.data, 'teste');
        },
      );

      test(
        'should return a DioException response in PATCH method',
        () async {
          when(() => dio.patch(any(), data: {})).thenThrow(
            DioException(requestOptions: RequestOptions()),
          );

          final response = await httpServiceImp.patch('/any-url', {});

          expect(response, isNull);
        },
      );
    },
  );
}
