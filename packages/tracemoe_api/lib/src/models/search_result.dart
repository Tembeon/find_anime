import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_result.freezed.dart';
part 'search_result.g.dart';

@freezed
class SearchResultModel with _$SearchResultModel {
  const factory SearchResultModel({
    int? frameCount,
    String? error,
    List<ResultModel>? result,
  }) = _SearchResultModel;

  factory SearchResultModel.fromJson(Map<String, dynamic> json) =>
      _$SearchResultModelFromJson(json);
}

@freezed
class ResultModel with _$ResultModel {
  const factory ResultModel({
    AnilistModel? anilist,
    String? filename,
    num? episode,
    num? from,
    num? to,
    num? similarity,
    String? video,
    String? image,
  }) = _ResultModel;

  factory ResultModel.fromJson(Map<String, dynamic> json) =>
      _$ResultModelFromJson(json);
}

@freezed
class AnilistModel with _$AnilistModel {
  const factory AnilistModel({
    int? id,
    int? idMal,
    TitleModel? title,
    List<String>? synonyms,
    bool? isAdult,
  }) = _AnilistModel;

  factory AnilistModel.fromJson(Map<String, dynamic> json) =>
      _$AnilistModelFromJson(json);
}

@freezed
class TitleModel with _$TitleModel {
  const factory TitleModel({
    String? native,
    String? romaji,
    String? english,
  }) = _TitleModel;

  factory TitleModel.fromJson(Map<String, dynamic> json) =>
      _$TitleModelFromJson(json);
}
