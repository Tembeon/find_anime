// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchResultModel _$$_SearchResultModelFromJson(Map<String, dynamic> json) =>
    _$_SearchResultModel(
      frameCount: json['frameCount'] as int?,
      error: json['error'] as String?,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => ResultModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SearchResultModelToJson(
        _$_SearchResultModel instance) =>
    <String, dynamic>{
      'frameCount': instance.frameCount,
      'error': instance.error,
      'result': instance.result,
    };

_$_ResultModel _$$_ResultModelFromJson(Map<String, dynamic> json) =>
    _$_ResultModel(
      anilist: json['anilist'] == null
          ? null
          : AnilistModel.fromJson(json['anilist'] as Map<String, dynamic>),
      filename: json['filename'] as String?,
      episode: json['episode'] as num?,
      from: json['from'] as num?,
      to: json['to'] as num?,
      similarity: json['similarity'] as num?,
      video: json['video'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$_ResultModelToJson(_$_ResultModel instance) =>
    <String, dynamic>{
      'anilist': instance.anilist,
      'filename': instance.filename,
      'episode': instance.episode,
      'from': instance.from,
      'to': instance.to,
      'similarity': instance.similarity,
      'video': instance.video,
      'image': instance.image,
    };

_$_AnilistModel _$$_AnilistModelFromJson(Map<String, dynamic> json) =>
    _$_AnilistModel(
      id: json['id'] as int?,
      idMal: json['idMal'] as int?,
      title: json['title'] == null
          ? null
          : TitleModel.fromJson(json['title'] as Map<String, dynamic>),
      synonyms: (json['synonyms'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isAdult: json['isAdult'] as bool?,
    );

Map<String, dynamic> _$$_AnilistModelToJson(_$_AnilistModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idMal': instance.idMal,
      'title': instance.title,
      'synonyms': instance.synonyms,
      'isAdult': instance.isAdult,
    };

_$_TitleModel _$$_TitleModelFromJson(Map<String, dynamic> json) =>
    _$_TitleModel(
      native: json['native'] as String?,
      romaji: json['romaji'] as String?,
      english: json['english'] as String?,
    );

Map<String, dynamic> _$$_TitleModelToJson(_$_TitleModel instance) =>
    <String, dynamic>{
      'native': instance.native,
      'romaji': instance.romaji,
      'english': instance.english,
    };
