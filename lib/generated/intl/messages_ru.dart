// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  static String m0(episodeNumber, momentTime) =>
      "Эпизод ${episodeNumber}, момент на ${momentTime}";

  static String m1(error) =>
      "Произошла неожиданная ошибка\nКод ошибки: ${error}";

  static String m2(similarityNum) => "Схожесть: ${similarityNum}%";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "adultOnly":
            MessageLookupByLibrary.simpleMessage("Только для взрослых!"),
        "copiedText": MessageLookupByLibrary.simpleMessage("Скопировано!"),
        "copyNameButton":
            MessageLookupByLibrary.simpleMessage("Копировать название"),
        "enterImageUrl":
            MessageLookupByLibrary.simpleMessage("Введите URL изображения"),
        "enterImageUrlHint": MessageLookupByLibrary.simpleMessage(
            "Ссылка на изображение дожна быть прямой"),
        "episodeText": m0,
        "error400": MessageLookupByLibrary.simpleMessage(
            "Предоставленное изображение пустое"),
        "error429": MessageLookupByLibrary.simpleMessage(
            "Слишком много запросов, попробуйте позже"),
        "error500": MessageLookupByLibrary.simpleMessage(
            "Что-то пошло не так на сервере"),
        "errorTimeOut": MessageLookupByLibrary.simpleMessage(
            "Время ответа сервера истекло"),
        "errorUnexpected": m1,
        "errorUnknown":
            MessageLookupByLibrary.simpleMessage("Что-то пошло не так"),
        "newSearch": MessageLookupByLibrary.simpleMessage("Новый поиск"),
        "noJapaneseName": MessageLookupByLibrary.simpleMessage(
            "Японское название не найдено"),
        "noRomajiName":
            MessageLookupByLibrary.simpleMessage("Ромадзи название не найдено"),
        "openSearchButton":
            MessageLookupByLibrary.simpleMessage("Открыть поиск"),
        "searchButtonText": MessageLookupByLibrary.simpleMessage("Найти"),
        "similarityText": m2,
        "viewInAnilist":
            MessageLookupByLibrary.simpleMessage("Открыть на anilist")
      };
}
