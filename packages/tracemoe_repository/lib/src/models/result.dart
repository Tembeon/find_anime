import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
class Result with _$Result {
  const factory Result({
    required num episode,
    required String similarity,
    required num moment,
    required String video,
    required int idMal,
    required bool adultOnly,
    required String? romajiName,
    required String? japaneseName,
  }) = _Result;
}
