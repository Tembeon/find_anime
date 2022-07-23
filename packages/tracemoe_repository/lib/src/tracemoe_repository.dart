import 'package:tracemoe_api/tracemoe_api.dart';
import 'package:tracemoe_repository/src/models/result.dart';

class EmptyResultFailure implements Exception {}

class TraceMoeRepository {
  TraceMoeRepository({TraceMoeApiClient? traceMoeApiClient})
      : _apiClient = traceMoeApiClient ?? TraceMoeApiClient();

  final TraceMoeApiClient _apiClient;

  Future<List<Result>> getResultByImageUrl(String url) async {
    SearchResultModel? test;
    try {
      final response = await _apiClient.getResultByImageUrl(url);
      test = response;

      if (response.result != null && response.result!.isNotEmpty) {
        List<Result> resultList = [];

        for (ResultModel result in response.result!) {
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
    } catch (e) {
      print('ERROR: $e\n\n RESPONSE: $test');
      rethrow;
    }
  }
}
