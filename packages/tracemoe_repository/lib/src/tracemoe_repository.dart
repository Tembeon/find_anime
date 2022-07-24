import 'dart:typed_data';

import 'package:tracemoe_api/tracemoe_api.dart';
import 'package:tracemoe_repository/src/models/result.dart';

class EmptyResultFailure implements Exception {}

class TraceMoeRepository {
  TraceMoeRepository({TraceMoeApiClient? traceMoeApiClient})
      : _apiClient = traceMoeApiClient ?? TraceMoeApiClient();

  final TraceMoeApiClient _apiClient;

  Future<List<Result>> getResultByImageUrl(String url) async {
    try {
      final response = await _apiClient.getResultByImageUrl(url);
      return _getResultList(response);
    } catch (e) {
      rethrow;
    }
  }

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

  List<Result> _getResultList(SearchResultModel model) {
    if (model.result != null && model.result!.isNotEmpty) {
      List<Result> resultList = [];

      for (ResultModel result in model.result!) {
        resultList.add(
          Result(
            similarity: result.similarity,
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
