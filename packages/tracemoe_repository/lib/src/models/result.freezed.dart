// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Result {
  num get episode => throw _privateConstructorUsedError;
  String get similarity => throw _privateConstructorUsedError;
  num get moment => throw _privateConstructorUsedError;
  String get video => throw _privateConstructorUsedError;
  int get idMal => throw _privateConstructorUsedError;
  bool get adultOnly => throw _privateConstructorUsedError;
  String? get romajiName => throw _privateConstructorUsedError;
  String? get japaneseName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResultCopyWith<Result> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultCopyWith<$Res> {
  factory $ResultCopyWith(Result value, $Res Function(Result) then) =
      _$ResultCopyWithImpl<$Res>;
  $Res call(
      {num episode,
      String similarity,
      num moment,
      String video,
      int idMal,
      bool adultOnly,
      String? romajiName,
      String? japaneseName});
}

/// @nodoc
class _$ResultCopyWithImpl<$Res> implements $ResultCopyWith<$Res> {
  _$ResultCopyWithImpl(this._value, this._then);

  final Result _value;
  // ignore: unused_field
  final $Res Function(Result) _then;

  @override
  $Res call({
    Object? episode = freezed,
    Object? similarity = freezed,
    Object? moment = freezed,
    Object? video = freezed,
    Object? idMal = freezed,
    Object? adultOnly = freezed,
    Object? romajiName = freezed,
    Object? japaneseName = freezed,
  }) {
    return _then(_value.copyWith(
      episode: episode == freezed
          ? _value.episode
          : episode // ignore: cast_nullable_to_non_nullable
              as num,
      similarity: similarity == freezed
          ? _value.similarity
          : similarity // ignore: cast_nullable_to_non_nullable
              as String,
      moment: moment == freezed
          ? _value.moment
          : moment // ignore: cast_nullable_to_non_nullable
              as num,
      video: video == freezed
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as String,
      idMal: idMal == freezed
          ? _value.idMal
          : idMal // ignore: cast_nullable_to_non_nullable
              as int,
      adultOnly: adultOnly == freezed
          ? _value.adultOnly
          : adultOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      romajiName: romajiName == freezed
          ? _value.romajiName
          : romajiName // ignore: cast_nullable_to_non_nullable
              as String?,
      japaneseName: japaneseName == freezed
          ? _value.japaneseName
          : japaneseName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_ResultCopyWith<$Res> implements $ResultCopyWith<$Res> {
  factory _$$_ResultCopyWith(_$_Result value, $Res Function(_$_Result) then) =
      __$$_ResultCopyWithImpl<$Res>;
  @override
  $Res call(
      {num episode,
      String similarity,
      num moment,
      String video,
      int idMal,
      bool adultOnly,
      String? romajiName,
      String? japaneseName});
}

/// @nodoc
class __$$_ResultCopyWithImpl<$Res> extends _$ResultCopyWithImpl<$Res>
    implements _$$_ResultCopyWith<$Res> {
  __$$_ResultCopyWithImpl(_$_Result _value, $Res Function(_$_Result) _then)
      : super(_value, (v) => _then(v as _$_Result));

  @override
  _$_Result get _value => super._value as _$_Result;

  @override
  $Res call({
    Object? episode = freezed,
    Object? similarity = freezed,
    Object? moment = freezed,
    Object? video = freezed,
    Object? idMal = freezed,
    Object? adultOnly = freezed,
    Object? romajiName = freezed,
    Object? japaneseName = freezed,
  }) {
    return _then(_$_Result(
      episode: episode == freezed
          ? _value.episode
          : episode // ignore: cast_nullable_to_non_nullable
              as num,
      similarity: similarity == freezed
          ? _value.similarity
          : similarity // ignore: cast_nullable_to_non_nullable
              as String,
      moment: moment == freezed
          ? _value.moment
          : moment // ignore: cast_nullable_to_non_nullable
              as num,
      video: video == freezed
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as String,
      idMal: idMal == freezed
          ? _value.idMal
          : idMal // ignore: cast_nullable_to_non_nullable
              as int,
      adultOnly: adultOnly == freezed
          ? _value.adultOnly
          : adultOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      romajiName: romajiName == freezed
          ? _value.romajiName
          : romajiName // ignore: cast_nullable_to_non_nullable
              as String?,
      japaneseName: japaneseName == freezed
          ? _value.japaneseName
          : japaneseName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Result implements _Result {
  const _$_Result(
      {required this.episode,
      required this.similarity,
      required this.moment,
      required this.video,
      required this.idMal,
      required this.adultOnly,
      required this.romajiName,
      required this.japaneseName});

  @override
  final num episode;
  @override
  final String similarity;
  @override
  final num moment;
  @override
  final String video;
  @override
  final int idMal;
  @override
  final bool adultOnly;
  @override
  final String? romajiName;
  @override
  final String? japaneseName;

  @override
  String toString() {
    return 'Result(episode: $episode, similarity: $similarity, moment: $moment, video: $video, idMal: $idMal, adultOnly: $adultOnly, romajiName: $romajiName, japaneseName: $japaneseName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Result &&
            const DeepCollectionEquality().equals(other.episode, episode) &&
            const DeepCollectionEquality()
                .equals(other.similarity, similarity) &&
            const DeepCollectionEquality().equals(other.moment, moment) &&
            const DeepCollectionEquality().equals(other.video, video) &&
            const DeepCollectionEquality().equals(other.idMal, idMal) &&
            const DeepCollectionEquality().equals(other.adultOnly, adultOnly) &&
            const DeepCollectionEquality()
                .equals(other.romajiName, romajiName) &&
            const DeepCollectionEquality()
                .equals(other.japaneseName, japaneseName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(episode),
      const DeepCollectionEquality().hash(similarity),
      const DeepCollectionEquality().hash(moment),
      const DeepCollectionEquality().hash(video),
      const DeepCollectionEquality().hash(idMal),
      const DeepCollectionEquality().hash(adultOnly),
      const DeepCollectionEquality().hash(romajiName),
      const DeepCollectionEquality().hash(japaneseName));

  @JsonKey(ignore: true)
  @override
  _$$_ResultCopyWith<_$_Result> get copyWith =>
      __$$_ResultCopyWithImpl<_$_Result>(this, _$identity);
}

abstract class _Result implements Result {
  const factory _Result(
      {required final num episode,
      required final String similarity,
      required final num moment,
      required final String video,
      required final int idMal,
      required final bool adultOnly,
      required final String? romajiName,
      required final String? japaneseName}) = _$_Result;

  @override
  num get episode;
  @override
  String get similarity;
  @override
  num get moment;
  @override
  String get video;
  @override
  int get idMal;
  @override
  bool get adultOnly;
  @override
  String? get romajiName;
  @override
  String? get japaneseName;
  @override
  @JsonKey(ignore: true)
  _$$_ResultCopyWith<_$_Result> get copyWith =>
      throw _privateConstructorUsedError;
}
