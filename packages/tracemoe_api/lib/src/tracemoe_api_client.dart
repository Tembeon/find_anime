import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;

import 'models/search_result.dart';

/// error 500
class SearchInternalErrorFailure implements Exception {}

/// error 503
class SearchQueueIsFullFailure implements Exception {}

/// error 504
class SearchServerOverloadFailure implements Exception {}

/// error 405
class MethodIsNotAllowedFailure implements Exception {}

/// error 403
class InvalidApiKeyFailure implements Exception {}

/// error 402
class SearchQuotaDepletedFailure implements Exception {}

/// error 400
class InvalidImageUrlFailure implements Exception {}

class TraceMoeApiClient {
  static const _baseUrl = 'https://api.trace.moe/search?anilistInfo';

  /// Send GET method to get result from TraceMoe with given image [url].
  ///
  /// Will throw exceptions according to the API documentation:
  /// https://soruly.github.io/trace.moe-api/#/docs?id=error-codes
  Future<SearchResultModel> getResultByImageUrl(String url) async {
    final response = await http.get(Uri.parse('$_baseUrl&url=$url'));

    return _getSearchModel(response);
  }

  Future<SearchResultModel> getResultByFile(
    Uint8List bytes, {
    required String mimeType,
  }) async {
    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: {
        'Content-Type': mimeType,
      },
      body: bytes,
    );

    return _getSearchModel(response);
  }

  SearchResultModel _getSearchModel(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return SearchResultModel.fromJson(jsonDecode(response.body));
      case 400:
        throw InvalidImageUrlFailure();
      case 402:
        throw SearchQuotaDepletedFailure();
      case 403:
        throw InvalidApiKeyFailure();
      case 405:
        throw MethodIsNotAllowedFailure();
      case 500:
        throw SearchInternalErrorFailure();
      case 503:
        throw SearchQueueIsFullFailure();
      case 504:
        throw SearchServerOverloadFailure();
      default:
        // unknown error occurred
        throw Exception();
    }
  }
}
