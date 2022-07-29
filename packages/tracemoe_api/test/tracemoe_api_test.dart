import 'package:flutter_test/flutter_test.dart';

import 'package:tracemoe_api/tracemoe_api.dart';

void main() {
  group('SearchResultModel', () {
    group('fromJson', () {
      test(
          'throws TypeError when result is unknown',
          () => {
                expect(
                  () => SearchResultModel.fromJson(<String, dynamic>{
                    'frameCount': 1,
                    'error': '',
                    'result': '',
                  }),
                  throwsA(isA<TypeError>()),
                )
              });
    });
  });
}
