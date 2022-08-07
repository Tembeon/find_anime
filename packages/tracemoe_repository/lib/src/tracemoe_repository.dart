import 'dart:typed_data';

import 'package:tracemoe_api/tracemoe_api.dart';
import 'package:tracemoe_repository/src/models/result.dart';

class EmptyResultFailure implements Exception {}

class TraceMoeRepository {
  TraceMoeRepository({TraceMoeApiClient? traceMoeApiClient})
      : _apiClient = traceMoeApiClient ?? TraceMoeApiClient();

  final TraceMoeApiClient _apiClient;

  /// Returns simplified processed API result of search via image in
  /// list of [Resul] models.
  ///
  ///
  /// Will throw exceptions according to the API documentation:
  /// https://soruly.github.io/trace.moe-api/#/docs?id=error-codes
  Future<List<Result>> getResultByImageUrl(String url) async {
    try {
      final response = await _apiClient.getResultByImageUrl(url);
      return _getResultList(response);
    } catch (e) {
      rethrow;
    }
  }

  /// Returns simplified processed API result of search via file in
  /// list of [Resul] models.
  ///
  /// Media can be an **image/\***, **video/\*** or **gif**.
  /// If a different file type is sent, [InvalidImageUrlFailure] will be thrown.
  ///
  /// Will throw exceptions according to the API documentation:
  /// https://soruly.github.io/trace.moe-api/#/docs?id=error-codes
  Future<List<Result>> getResultByFile(
    Uint8List bytes, {
    required String mimeType,
  }) async {
    try {
      final response = await _apiClient.getResultByFile(
        bytes,
        mimeType: mimeType,
      );
      return _getResultList(response);
    } catch (e) {
      rethrow;
    }
  }

  /// Processes raw API result and returns list of [Result].
  ///
  /// Will throw [EmptyResultFailure] if result was empty.
  List<Result> _getResultList(SearchResultModel model) {
    if (model.result != null && model.result!.isNotEmpty) {
      List<Result> resultList = [];

      for (ResultModel result in model.result!) {
        resultList.add(
          Result(
            similarity: result.similarity == null
                ? ''
                : (result.similarity! * 100).toStringAsFixed(1),
            episode: result.episode ?? 0,
            moment: result.from ?? 0,
            video: result.video!,
            idMal: result.anilist!.idMal!,
            adultOnly: result.anilist!.isAdult ?? false,
            romajiName: result.anilist!.title!.romaji,
            japaneseName: result.anilist!.title!.native,
          ),
        );
      }

      return resultList;
    } else {
      throw EmptyResultFailure();
    }
  }
}
