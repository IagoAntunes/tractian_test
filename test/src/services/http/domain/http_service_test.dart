import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tractian_test/core/services/http/i_http_response.dart';
import 'package:tractian_test/core/services/http/i_http_service.dart';

import '../../../../core/mocks/http_service_mock.dart';

void main() {
  late IHttpService httpService;

  setUp(() {
    httpService = MockHttpService();
  });

  final responseSuccess =
      HttpResponse(statusCode: 200, data: 'mock data', headers: {});

  group('Get method', () {
    test(
      'should be return a success response in get method',
      () async {
        when(() => httpService.get(''))
            .thenAnswer((_) async => responseSuccess);

        final response = await httpService.get('');
        expect(response?.statusCode, 200);
        expect(response?.data, responseSuccess.data);
      },
    );
  });
}
