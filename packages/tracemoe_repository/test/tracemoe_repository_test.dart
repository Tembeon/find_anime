import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tracemoe_api/tracemoe_api.dart';
import 'package:tracemoe_repository/tracemoe_repository.dart';

class MockTraceMoeApiClient extends Mock implements TraceMoeApiClient {}

class MockSearchResultModel extends Mock implements SearchResultModel {}

void main() {
  group('TraceMoeRepository', () {
    late TraceMoeApiClient traceMoeApiClient;
    late TraceMoeRepository traceMoeRepository;

    setUpAll(() {
      registerFallbackValue(Uint8List(1));
    });

    setUp(() {
      traceMoeApiClient = MockTraceMoeApiClient();
      traceMoeRepository =
          TraceMoeRepository(traceMoeApiClient: traceMoeApiClient);
    });

    group('constructor', () {
      test('instantiates internal TraceMoeApiClient when not injected ', () {
        expect(TraceMoeRepository(), isNotNull);
      });
    });

    group('get result', () {
      const imageUrl = 'https://sample.com';
      final imageBytes = Uint8List(1);
      const String mimeType = 'image/png';

      test('get result via image url', () async {
        try {
          await traceMoeRepository.getResultByImageUrl(imageUrl);
        } catch (_) {}
        verify(() => traceMoeApiClient.getResultByImageUrl(imageUrl)).called(1);
      });

      test('throws an exception when search via url fails', () async {
        when(() => traceMoeApiClient.getResultByImageUrl(any()))
            .thenThrow(SearchInternalErrorFailure());

        expect(
          () async => await traceMoeRepository.getResultByImageUrl(imageUrl),
          throwsA(isA<SearchInternalErrorFailure>()),
        );
      });

      test('get result via file search', () async {
        try {
          await traceMoeRepository.getResultByFile(
            imageBytes,
            mimeType: mimeType,
          );
        } catch (_) {}

        verify(
          () => traceMoeApiClient.getResultByFile(
            imageBytes,
            mimeType: mimeType,
          ),
        ).called(1);
      });

      test('throws an exception when search via file fails', () {
        when(
          () => traceMoeApiClient.getResultByFile(
            any(),
            mimeType: any(named: 'mimeType'),
          ),
        ).thenThrow(InvalidImageUrlFailure());

        expect(
          () async => await traceMoeRepository.getResultByFile(
            imageBytes,
            mimeType: mimeType,
          ),
          throwsA(isA<InvalidImageUrlFailure>()),
        );
      });

      test('throw EmptyResultException when search', () {
        final Future<SearchResultModel> future =
            Future<SearchResultModel>.delayed(
          Duration.zero,
          () => const SearchResultModel(
            frameCount: 0,
            error: '',
            result: [],
          ),
        );

        when(
          () => traceMoeApiClient.getResultByImageUrl(
            any(),
          ),
        ).thenAnswer(
          (_) => future,
        );

        when(
          () => traceMoeApiClient.getResultByFile(
            any(),
            mimeType: any(named: 'mimeType'),
          ),
        ).thenAnswer(
          (_) => future,
        );

        expect(
          () => traceMoeRepository.getResultByImageUrl(imageUrl),
          throwsA(
            isA<EmptyResultFailure>(),
          ),
        );

        expect(
          () => traceMoeRepository.getResultByFile(
            imageBytes,
            mimeType: mimeType,
          ),
          throwsA(
            isA<EmptyResultFailure>(),
          ),
        );
      });
    });
  });
}
