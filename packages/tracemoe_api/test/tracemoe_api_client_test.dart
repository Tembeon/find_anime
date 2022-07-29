import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:tracemoe_api/tracemoe_api.dart';

class MockHttpClient extends Mock implements http.Client {}

class MockResponse extends Mock implements http.Response {}

class FakeUri extends Fake implements Uri {}

void main() {
  group('TraceMoeApiClient', () {
    late http.Client httpClient;
    late TraceMoeApiClient traceMoeApiClient;
    String jsonBody = '''{
          "frameCount": 26914796,
          "error": "",
          "result": [
            {
              "anilist": {
                "id": 577,
                "idMal": 577,
                "title": {
                  "native": "鍵姫物語 永久アリス輪舞曲",
                  "romaji": "Kagihime Monogatari: Eikyuu Alice Rinbukyoku",
                  "english": "Key Princess Story Eternal Alice Rondo"
                },
                "synonyms": [
                  "Kagihime",
                  "Kagihime Monogatari Eikyuu Alice Rondo",
                  "Kagihime Monogatari - Eikyuu Alice Rondo"
                ],
                "isAdult": false
              },
              "filename": "Kagihime Monogatari - 01 A Rabbit Hole.mp4",
              "episode": 1,
              "from": 522.25,
              "to": 527.25,
              "similarity": 0.8873692863583079,
              "video":
                  "https://media.trace.moe/video/577/Kagihime%20Monogatari%20-%2001%20A%20Rabbit%20Hole.mp4?t=524.75&now=1659085200&token=j2kR4rEooHoNpEug5bCSNgRXg",
              "image":
                  "https://media.trace.moe/image/577/Kagihime%20Monogatari%20-%2001%20A%20Rabbit%20Hole.mp4.jpg?t=524.75&now=1659085200&token=yMsMX11FeIoNHYgtZHlKw9zTdUk"
            }
          ]
        }''';

    setUpAll(() {
      registerFallbackValue(FakeUri());
    });

    setUp(() {
      httpClient = MockHttpClient();
      traceMoeApiClient = TraceMoeApiClient(httpClient: httpClient);
    });

    group('constructor', () {
      test('does not require am httpClient', () {
        expect(TraceMoeApiClient(), isNotNull);
      });
    });

    group('search via image url', () {
      const searchQuery = 'mock-search';
      const baseUrl = 'https://api.trace.moe/search?anilistInfo';

      test('check get request with 200 postcode', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn('{}');
        when(() => httpClient.get(any())).thenAnswer((_) async => response);

        try {
          await traceMoeApiClient.getResultByImageUrl(searchQuery);
        } catch (_) {}

        verify(
          () => httpClient.get(
            Uri.parse('$baseUrl&url=$searchQuery'),
          ),
        ).called(1);
      });

      test('make get result with 500 postcode', () {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(500);
        when(() => response.body).thenReturn('{}');
        when(() => httpClient.get(any())).thenAnswer((_) async => response);
        expect(
            () async =>
                await traceMoeApiClient.getResultByImageUrl(searchQuery),
            throwsA(isA<SearchInternalErrorFailure>()));
      });

      test('make get result with 503 postcode', () {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(503);
        when(() => response.body).thenReturn('{}');
        when(() => httpClient.get(any())).thenAnswer((_) async => response);
        expect(
            () async =>
                await traceMoeApiClient.getResultByImageUrl(searchQuery),
            throwsA(isA<SearchQueueIsFullFailure>()));
      });

      test('make get result with 504 postcode', () {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(504);
        when(() => response.body).thenReturn('{}');
        when(() => httpClient.get(any())).thenAnswer((_) async => response);
        expect(
            () async =>
                await traceMoeApiClient.getResultByImageUrl(searchQuery),
            throwsA(isA<SearchServerOverloadFailure>()));
      });

      test('make get result with 405 postcode', () {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(405);
        when(() => response.body).thenReturn('{}');
        when(() => httpClient.get(any())).thenAnswer((_) async => response);
        expect(
            () async =>
                await traceMoeApiClient.getResultByImageUrl(searchQuery),
            throwsA(isA<MethodIsNotAllowedFailure>()));
      });

      test('make get result with 403 postcode', () {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(403);
        when(() => response.body).thenReturn('{}');
        when(() => httpClient.get(any())).thenAnswer((_) async => response);
        expect(
            () async =>
                await traceMoeApiClient.getResultByImageUrl(searchQuery),
            throwsA(isA<InvalidApiKeyFailure>()));
      });

      test('make get result with 402 postcode', () {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(402);
        when(() => response.body).thenReturn('{}');
        when(() => httpClient.get(any())).thenAnswer((_) async => response);
        expect(
            () async =>
                await traceMoeApiClient.getResultByImageUrl(searchQuery),
            throwsA(isA<SearchQuotaDepletedFailure>()));
      });

      test('make get result with 400 postcode', () {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(400);
        when(() => response.body).thenReturn('{}');
        when(() => httpClient.get(any())).thenAnswer((_) async => response);
        expect(
            () async =>
                await traceMoeApiClient.getResultByImageUrl(searchQuery),
            throwsA(isA<InvalidImageUrlFailure>()));
      });

      test('make get result with any other postcode', () {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(404);
        when(() => response.body).thenReturn('{}');
        when(() => httpClient.get(any())).thenAnswer((_) async => response);
        expect(
            () async =>
                await traceMoeApiClient.getResultByImageUrl(searchQuery),
            throwsA(isA<Exception>()));
      });

      test('make get result with valid response', () async {
        final response = MockResponse();

        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn(jsonBody);
        when(() => httpClient.get(any())).thenAnswer((_) async => response);
        final result = await traceMoeApiClient.getResultByImageUrl(searchQuery);
        expect(
          result,
          isA<SearchResultModel>()
              .having((p0) => p0.result!.length, 'length of list<Anilist>', 1)
              .having((p0) => p0.frameCount, 'type check', isA<int?>())
              .having((p0) => p0.result!.first.anilist!.isAdult,
                  'type check isAdult', allOf(isA<bool>(), false)),
        );
      });
    });

    group('search via file', () {
      Uint8List fileBytes = Uint8List(10);
      const mimeType = 'image/png';
      const baseUrl = 'https://api.trace.moe/search?anilistInfo';

      test('check post request with 200 postcode', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn('{}');
        when(() => httpClient.post(any())).thenAnswer((_) async => response);

        try {
          await traceMoeApiClient.getResultByFile(fileBytes,
              mimeType: mimeType);
        } catch (_) {}

        verify(
          () => httpClient.post(
            Uri.parse(baseUrl),
            headers: {
              'Content-Type': mimeType,
            },
            body: fileBytes,
          ),
        ).called(1);
      });

      test('make post request with 200 postcode', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn(jsonBody);
        when(
          () => httpClient.post(
            any(),
            body: any(named: 'body'),
            headers: any(named: 'headers'),
          ),
        ).thenAnswer((_) async => response);

        final result = await traceMoeApiClient.getResultByFile(fileBytes,
            mimeType: mimeType);

        expect(
          result,
          isA<SearchResultModel>()
              .having((p0) => p0.result!.length, 'length of list<Anilist>', 1)
              .having((p0) => p0.frameCount, 'type check', isA<int?>())
              .having((p0) => p0.result!.first.anilist!.isAdult,
                  'type check isAdult', allOf(isA<bool>(), false)),
        );
      });

      test('make post request with non-200 postcode', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(402);
        when(() => response.body).thenReturn(jsonBody);
        when(
          () => httpClient.post(
            any(),
            body: any(named: 'body'),
            headers: any(named: 'headers'),
          ),
        ).thenAnswer((_) async => response);

        expect(
            () async => await traceMoeApiClient.getResultByFile(fileBytes,
                mimeType: mimeType),
            throwsA(isA<SearchQuotaDepletedFailure>()));
      });
    });
  });
}
