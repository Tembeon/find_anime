// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'search_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchResultModel _$SearchResultModelFromJson(Map<String, dynamic> json) {
  return _SearchResultModel.fromJson(json);
}

/// @nodoc
mixin _$SearchResultModel {
  int? get frameCount => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  List<ResultModel>? get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchResultModelCopyWith<SearchResultModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchResultModelCopyWith<$Res> {
  factory $SearchResultModelCopyWith(
          SearchResultModel value, $Res Function(SearchResultModel) then) =
      _$SearchResultModelCopyWithImpl<$Res>;
  $Res call({int? frameCount, String? error, List<ResultModel>? result});
}

/// @nodoc
class _$SearchResultModelCopyWithImpl<$Res>
    implements $SearchResultModelCopyWith<$Res> {
  _$SearchResultModelCopyWithImpl(this._value, this._then);

  final SearchResultModel _value;
  // ignore: unused_field
  final $Res Function(SearchResultModel) _then;

  @override
  $Res call({
    Object? frameCount = freezed,
    Object? error = freezed,
    Object? result = freezed,
  }) {
    return _then(_value.copyWith(
      frameCount: frameCount == freezed
          ? _value.frameCount
          : frameCount // ignore: cast_nullable_to_non_nullable
              as int?,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      result: result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as List<ResultModel>?,
    ));
  }
}

/// @nodoc
abstract class _$$_SearchResultModelCopyWith<$Res>
    implements $SearchResultModelCopyWith<$Res> {
  factory _$$_SearchResultModelCopyWith(_$_SearchResultModel value,
          $Res Function(_$_SearchResultModel) then) =
      __$$_SearchResultModelCopyWithImpl<$Res>;
  @override
  $Res call({int? frameCount, String? error, List<ResultModel>? result});
}

/// @nodoc
class __$$_SearchResultModelCopyWithImpl<$Res>
    extends _$SearchResultModelCopyWithImpl<$Res>
    implements _$$_SearchResultModelCopyWith<$Res> {
  __$$_SearchResultModelCopyWithImpl(
      _$_SearchResultModel _value, $Res Function(_$_SearchResultModel) _then)
      : super(_value, (v) => _then(v as _$_SearchResultModel));

  @override
  _$_SearchResultModel get _value => super._value as _$_SearchResultModel;

  @override
  $Res call({
    Object? frameCount = freezed,
    Object? error = freezed,
    Object? result = freezed,
  }) {
    return _then(_$_SearchResultModel(
      frameCount: frameCount == freezed
          ? _value.frameCount
          : frameCount // ignore: cast_nullable_to_non_nullable
              as int?,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      result: result == freezed
          ? _value._result
          : result // ignore: cast_nullable_to_non_nullable
              as List<ResultModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SearchResultModel implements _SearchResultModel {
  const _$_SearchResultModel(
      {this.frameCount, this.error, final List<ResultModel>? result})
      : _result = result;

  factory _$_SearchResultModel.fromJson(Map<String, dynamic> json) =>
      _$$_SearchResultModelFromJson(json);

  @override
  final int? frameCount;
  @override
  final String? error;
  final List<ResultModel>? _result;
  @override
  List<ResultModel>? get result {
    final value = _result;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SearchResultModel(frameCount: $frameCount, error: $error, result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchResultModel &&
            const DeepCollectionEquality()
                .equals(other.frameCount, frameCount) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality().equals(other._result, _result));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(frameCount),
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(_result));

  @JsonKey(ignore: true)
  @override
  _$$_SearchResultModelCopyWith<_$_SearchResultModel> get copyWith =>
      __$$_SearchResultModelCopyWithImpl<_$_SearchResultModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SearchResultModelToJson(
      this,
    );
  }
}

abstract class _SearchResultModel implements SearchResultModel {
  const factory _SearchResultModel(
      {final int? frameCount,
      final String? error,
      final List<ResultModel>? result}) = _$_SearchResultModel;

  factory _SearchResultModel.fromJson(Map<String, dynamic> json) =
      _$_SearchResultModel.fromJson;

  @override
  int? get frameCount;
  @override
  String? get error;
  @override
  List<ResultModel>? get result;
  @override
  @JsonKey(ignore: true)
  _$$_SearchResultModelCopyWith<_$_SearchResultModel> get copyWith =>
      throw _privateConstructorUsedError;
}

ResultModel _$ResultModelFromJson(Map<String, dynamic> json) {
  return _ResultModel.fromJson(json);
}

/// @nodoc
mixin _$ResultModel {
  AnilistModel? get anilist => throw _privateConstructorUsedError;
  String? get filename => throw _privateConstructorUsedError;
  num? get episode => throw _privateConstructorUsedError;
  num? get from => throw _privateConstructorUsedError;
  num? get to => throw _privateConstructorUsedError;
  num? get similarity => throw _privateConstructorUsedError;
  String? get video => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResultModelCopyWith<ResultModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultModelCopyWith<$Res> {
  factory $ResultModelCopyWith(
          ResultModel value, $Res Function(ResultModel) then) =
      _$ResultModelCopyWithImpl<$Res>;
  $Res call(
      {AnilistModel? anilist,
      String? filename,
      num? episode,
      num? from,
      num? to,
      num? similarity,
      String? video,
      String? image});

  $AnilistModelCopyWith<$Res>? get anilist;
}

/// @nodoc
class _$ResultModelCopyWithImpl<$Res> implements $ResultModelCopyWith<$Res> {
  _$ResultModelCopyWithImpl(this._value, this._then);

  final ResultModel _value;
  // ignore: unused_field
  final $Res Function(ResultModel) _then;

  @override
  $Res call({
    Object? anilist = freezed,
    Object? filename = freezed,
    Object? episode = freezed,
    Object? from = freezed,
    Object? to = freezed,
    Object? similarity = freezed,
    Object? video = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      anilist: anilist == freezed
          ? _value.anilist
          : anilist // ignore: cast_nullable_to_non_nullable
              as AnilistModel?,
      filename: filename == freezed
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String?,
      episode: episode == freezed
          ? _value.episode
          : episode // ignore: cast_nullable_to_non_nullable
              as num?,
      from: from == freezed
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as num?,
      to: to == freezed
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as num?,
      similarity: similarity == freezed
          ? _value.similarity
          : similarity // ignore: cast_nullable_to_non_nullable
              as num?,
      video: video == freezed
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as String?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $AnilistModelCopyWith<$Res>? get anilist {
    if (_value.anilist == null) {
      return null;
    }

    return $AnilistModelCopyWith<$Res>(_value.anilist!, (value) {
      return _then(_value.copyWith(anilist: value));
    });
  }
}

/// @nodoc
abstract class _$$_ResultModelCopyWith<$Res>
    implements $ResultModelCopyWith<$Res> {
  factory _$$_ResultModelCopyWith(
          _$_ResultModel value, $Res Function(_$_ResultModel) then) =
      __$$_ResultModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {AnilistModel? anilist,
      String? filename,
      num? episode,
      num? from,
      num? to,
      num? similarity,
      String? video,
      String? image});

  @override
  $AnilistModelCopyWith<$Res>? get anilist;
}

/// @nodoc
class __$$_ResultModelCopyWithImpl<$Res> extends _$ResultModelCopyWithImpl<$Res>
    implements _$$_ResultModelCopyWith<$Res> {
  __$$_ResultModelCopyWithImpl(
      _$_ResultModel _value, $Res Function(_$_ResultModel) _then)
      : super(_value, (v) => _then(v as _$_ResultModel));

  @override
  _$_ResultModel get _value => super._value as _$_ResultModel;

  @override
  $Res call({
    Object? anilist = freezed,
    Object? filename = freezed,
    Object? episode = freezed,
    Object? from = freezed,
    Object? to = freezed,
    Object? similarity = freezed,
    Object? video = freezed,
    Object? image = freezed,
  }) {
    return _then(_$_ResultModel(
      anilist: anilist == freezed
          ? _value.anilist
          : anilist // ignore: cast_nullable_to_non_nullable
              as AnilistModel?,
      filename: filename == freezed
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String?,
      episode: episode == freezed
          ? _value.episode
          : episode // ignore: cast_nullable_to_non_nullable
              as num?,
      from: from == freezed
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as num?,
      to: to == freezed
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as num?,
      similarity: similarity == freezed
          ? _value.similarity
          : similarity // ignore: cast_nullable_to_non_nullable
              as num?,
      video: video == freezed
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as String?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ResultModel implements _ResultModel {
  const _$_ResultModel(
      {this.anilist,
      this.filename,
      this.episode,
      this.from,
      this.to,
      this.similarity,
      this.video,
      this.image});

  factory _$_ResultModel.fromJson(Map<String, dynamic> json) =>
      _$$_ResultModelFromJson(json);

  @override
  final AnilistModel? anilist;
  @override
  final String? filename;
  @override
  final num? episode;
  @override
  final num? from;
  @override
  final num? to;
  @override
  final num? similarity;
  @override
  final String? video;
  @override
  final String? image;

  @override
  String toString() {
    return 'ResultModel(anilist: $anilist, filename: $filename, episode: $episode, from: $from, to: $to, similarity: $similarity, video: $video, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResultModel &&
            const DeepCollectionEquality().equals(other.anilist, anilist) &&
            const DeepCollectionEquality().equals(other.filename, filename) &&
            const DeepCollectionEquality().equals(other.episode, episode) &&
            const DeepCollectionEquality().equals(other.from, from) &&
            const DeepCollectionEquality().equals(other.to, to) &&
            const DeepCollectionEquality()
                .equals(other.similarity, similarity) &&
            const DeepCollectionEquality().equals(other.video, video) &&
            const DeepCollectionEquality().equals(other.image, image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(anilist),
      const DeepCollectionEquality().hash(filename),
      const DeepCollectionEquality().hash(episode),
      const DeepCollectionEquality().hash(from),
      const DeepCollectionEquality().hash(to),
      const DeepCollectionEquality().hash(similarity),
      const DeepCollectionEquality().hash(video),
      const DeepCollectionEquality().hash(image));

  @JsonKey(ignore: true)
  @override
  _$$_ResultModelCopyWith<_$_ResultModel> get copyWith =>
      __$$_ResultModelCopyWithImpl<_$_ResultModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResultModelToJson(
      this,
    );
  }
}

abstract class _ResultModel implements ResultModel {
  const factory _ResultModel(
      {final AnilistModel? anilist,
      final String? filename,
      final num? episode,
      final num? from,
      final num? to,
      final num? similarity,
      final String? video,
      final String? image}) = _$_ResultModel;

  factory _ResultModel.fromJson(Map<String, dynamic> json) =
      _$_ResultModel.fromJson;

  @override
  AnilistModel? get anilist;
  @override
  String? get filename;
  @override
  num? get episode;
  @override
  num? get from;
  @override
  num? get to;
  @override
  num? get similarity;
  @override
  String? get video;
  @override
  String? get image;
  @override
  @JsonKey(ignore: true)
  _$$_ResultModelCopyWith<_$_ResultModel> get copyWith =>
      throw _privateConstructorUsedError;
}

AnilistModel _$AnilistModelFromJson(Map<String, dynamic> json) {
  return _AnilistModel.fromJson(json);
}

/// @nodoc
mixin _$AnilistModel {
  int? get id => throw _privateConstructorUsedError;
  int? get idMal => throw _privateConstructorUsedError;
  TitleModel? get title => throw _privateConstructorUsedError;
  List<String>? get synonyms => throw _privateConstructorUsedError;
  bool? get isAdult => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnilistModelCopyWith<AnilistModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnilistModelCopyWith<$Res> {
  factory $AnilistModelCopyWith(
          AnilistModel value, $Res Function(AnilistModel) then) =
      _$AnilistModelCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      int? idMal,
      TitleModel? title,
      List<String>? synonyms,
      bool? isAdult});

  $TitleModelCopyWith<$Res>? get title;
}

/// @nodoc
class _$AnilistModelCopyWithImpl<$Res> implements $AnilistModelCopyWith<$Res> {
  _$AnilistModelCopyWithImpl(this._value, this._then);

  final AnilistModel _value;
  // ignore: unused_field
  final $Res Function(AnilistModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? idMal = freezed,
    Object? title = freezed,
    Object? synonyms = freezed,
    Object? isAdult = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      idMal: idMal == freezed
          ? _value.idMal
          : idMal // ignore: cast_nullable_to_non_nullable
              as int?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as TitleModel?,
      synonyms: synonyms == freezed
          ? _value.synonyms
          : synonyms // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isAdult: isAdult == freezed
          ? _value.isAdult
          : isAdult // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }

  @override
  $TitleModelCopyWith<$Res>? get title {
    if (_value.title == null) {
      return null;
    }

    return $TitleModelCopyWith<$Res>(_value.title!, (value) {
      return _then(_value.copyWith(title: value));
    });
  }
}

/// @nodoc
abstract class _$$_AnilistModelCopyWith<$Res>
    implements $AnilistModelCopyWith<$Res> {
  factory _$$_AnilistModelCopyWith(
          _$_AnilistModel value, $Res Function(_$_AnilistModel) then) =
      __$$_AnilistModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      int? idMal,
      TitleModel? title,
      List<String>? synonyms,
      bool? isAdult});

  @override
  $TitleModelCopyWith<$Res>? get title;
}

/// @nodoc
class __$$_AnilistModelCopyWithImpl<$Res>
    extends _$AnilistModelCopyWithImpl<$Res>
    implements _$$_AnilistModelCopyWith<$Res> {
  __$$_AnilistModelCopyWithImpl(
      _$_AnilistModel _value, $Res Function(_$_AnilistModel) _then)
      : super(_value, (v) => _then(v as _$_AnilistModel));

  @override
  _$_AnilistModel get _value => super._value as _$_AnilistModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? idMal = freezed,
    Object? title = freezed,
    Object? synonyms = freezed,
    Object? isAdult = freezed,
  }) {
    return _then(_$_AnilistModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      idMal: idMal == freezed
          ? _value.idMal
          : idMal // ignore: cast_nullable_to_non_nullable
              as int?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as TitleModel?,
      synonyms: synonyms == freezed
          ? _value._synonyms
          : synonyms // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isAdult: isAdult == freezed
          ? _value.isAdult
          : isAdult // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AnilistModel implements _AnilistModel {
  const _$_AnilistModel(
      {this.id,
      this.idMal,
      this.title,
      final List<String>? synonyms,
      this.isAdult})
      : _synonyms = synonyms;

  factory _$_AnilistModel.fromJson(Map<String, dynamic> json) =>
      _$$_AnilistModelFromJson(json);

  @override
  final int? id;
  @override
  final int? idMal;
  @override
  final TitleModel? title;
  final List<String>? _synonyms;
  @override
  List<String>? get synonyms {
    final value = _synonyms;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? isAdult;

  @override
  String toString() {
    return 'AnilistModel(id: $id, idMal: $idMal, title: $title, synonyms: $synonyms, isAdult: $isAdult)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnilistModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.idMal, idMal) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other._synonyms, _synonyms) &&
            const DeepCollectionEquality().equals(other.isAdult, isAdult));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(idMal),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(_synonyms),
      const DeepCollectionEquality().hash(isAdult));

  @JsonKey(ignore: true)
  @override
  _$$_AnilistModelCopyWith<_$_AnilistModel> get copyWith =>
      __$$_AnilistModelCopyWithImpl<_$_AnilistModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnilistModelToJson(
      this,
    );
  }
}

abstract class _AnilistModel implements AnilistModel {
  const factory _AnilistModel(
      {final int? id,
      final int? idMal,
      final TitleModel? title,
      final List<String>? synonyms,
      final bool? isAdult}) = _$_AnilistModel;

  factory _AnilistModel.fromJson(Map<String, dynamic> json) =
      _$_AnilistModel.fromJson;

  @override
  int? get id;
  @override
  int? get idMal;
  @override
  TitleModel? get title;
  @override
  List<String>? get synonyms;
  @override
  bool? get isAdult;
  @override
  @JsonKey(ignore: true)
  _$$_AnilistModelCopyWith<_$_AnilistModel> get copyWith =>
      throw _privateConstructorUsedError;
}

TitleModel _$TitleModelFromJson(Map<String, dynamic> json) {
  return _TitleModel.fromJson(json);
}

/// @nodoc
mixin _$TitleModel {
  String? get native => throw _privateConstructorUsedError;
  String? get romaji => throw _privateConstructorUsedError;
  String? get english => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TitleModelCopyWith<TitleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TitleModelCopyWith<$Res> {
  factory $TitleModelCopyWith(
          TitleModel value, $Res Function(TitleModel) then) =
      _$TitleModelCopyWithImpl<$Res>;
  $Res call({String? native, String? romaji, String? english});
}

/// @nodoc
class _$TitleModelCopyWithImpl<$Res> implements $TitleModelCopyWith<$Res> {
  _$TitleModelCopyWithImpl(this._value, this._then);

  final TitleModel _value;
  // ignore: unused_field
  final $Res Function(TitleModel) _then;

  @override
  $Res call({
    Object? native = freezed,
    Object? romaji = freezed,
    Object? english = freezed,
  }) {
    return _then(_value.copyWith(
      native: native == freezed
          ? _value.native
          : native // ignore: cast_nullable_to_non_nullable
              as String?,
      romaji: romaji == freezed
          ? _value.romaji
          : romaji // ignore: cast_nullable_to_non_nullable
              as String?,
      english: english == freezed
          ? _value.english
          : english // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_TitleModelCopyWith<$Res>
    implements $TitleModelCopyWith<$Res> {
  factory _$$_TitleModelCopyWith(
          _$_TitleModel value, $Res Function(_$_TitleModel) then) =
      __$$_TitleModelCopyWithImpl<$Res>;
  @override
  $Res call({String? native, String? romaji, String? english});
}

/// @nodoc
class __$$_TitleModelCopyWithImpl<$Res> extends _$TitleModelCopyWithImpl<$Res>
    implements _$$_TitleModelCopyWith<$Res> {
  __$$_TitleModelCopyWithImpl(
      _$_TitleModel _value, $Res Function(_$_TitleModel) _then)
      : super(_value, (v) => _then(v as _$_TitleModel));

  @override
  _$_TitleModel get _value => super._value as _$_TitleModel;

  @override
  $Res call({
    Object? native = freezed,
    Object? romaji = freezed,
    Object? english = freezed,
  }) {
    return _then(_$_TitleModel(
      native: native == freezed
          ? _value.native
          : native // ignore: cast_nullable_to_non_nullable
              as String?,
      romaji: romaji == freezed
          ? _value.romaji
          : romaji // ignore: cast_nullable_to_non_nullable
              as String?,
      english: english == freezed
          ? _value.english
          : english // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TitleModel implements _TitleModel {
  const _$_TitleModel({this.native, this.romaji, this.english});

  factory _$_TitleModel.fromJson(Map<String, dynamic> json) =>
      _$$_TitleModelFromJson(json);

  @override
  final String? native;
  @override
  final String? romaji;
  @override
  final String? english;

  @override
  String toString() {
    return 'TitleModel(native: $native, romaji: $romaji, english: $english)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TitleModel &&
            const DeepCollectionEquality().equals(other.native, native) &&
            const DeepCollectionEquality().equals(other.romaji, romaji) &&
            const DeepCollectionEquality().equals(other.english, english));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(native),
      const DeepCollectionEquality().hash(romaji),
      const DeepCollectionEquality().hash(english));

  @JsonKey(ignore: true)
  @override
  _$$_TitleModelCopyWith<_$_TitleModel> get copyWith =>
      __$$_TitleModelCopyWithImpl<_$_TitleModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TitleModelToJson(
      this,
    );
  }
}

abstract class _TitleModel implements TitleModel {
  const factory _TitleModel(
      {final String? native,
      final String? romaji,
      final String? english}) = _$_TitleModel;

  factory _TitleModel.fromJson(Map<String, dynamic> json) =
      _$_TitleModel.fromJson;

  @override
  String? get native;
  @override
  String? get romaji;
  @override
  String? get english;
  @override
  @JsonKey(ignore: true)
  _$$_TitleModelCopyWith<_$_TitleModel> get copyWith =>
      throw _privateConstructorUsedError;
}
