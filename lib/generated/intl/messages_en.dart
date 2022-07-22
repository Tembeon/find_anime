// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(episodeNumber, momentTime) =>
      "Episode ${episodeNumber}, moment at ${momentTime}";

  static String m1(error) => "Unexpected error has occurred\nError: ${error}";

  static String m2(similarityNum) => "Similarity: ${similarityNum}%";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "adultOnly": MessageLookupByLibrary.simpleMessage("Adult only!"),
        "copiedText": MessageLookupByLibrary.simpleMessage("Copied!"),
        "copyNameButton": MessageLookupByLibrary.simpleMessage("Copy name"),
        "enterImageUrl":
            MessageLookupByLibrary.simpleMessage("Enter image URL"),
        "enterImageUrlHint": MessageLookupByLibrary.simpleMessage(
            "Link should be direct to image"),
        "episodeText": m0,
        "error400":
            MessageLookupByLibrary.simpleMessage("Provided image is empty"),
        "error429": MessageLookupByLibrary.simpleMessage(
            "Too many requests, please try again later"),
        "error500":
            MessageLookupByLibrary.simpleMessage("Something wrong on server"),
        "errorTimeOut":
            MessageLookupByLibrary.simpleMessage("Response timed out"),
        "errorUnexpected": m1,
        "errorUnknown":
            MessageLookupByLibrary.simpleMessage("Something went wrong"),
        "newSearch": MessageLookupByLibrary.simpleMessage("New search"),
        "noJapaneseName":
            MessageLookupByLibrary.simpleMessage("No japanese name"),
        "noRomajiName": MessageLookupByLibrary.simpleMessage("No romaji name"),
        "openSearchButton": MessageLookupByLibrary.simpleMessage("Open search"),
        "searchButtonText": MessageLookupByLibrary.simpleMessage("Search"),
        "similarityText": m2,
        "viewInAnilist": MessageLookupByLibrary.simpleMessage("View in anilist")
      };
}
