// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `New search`
  String get newSearch {
    return Intl.message(
      'New search',
      name: 'newSearch',
      desc: 'Title on the search page',
      args: [],
    );
  }

  /// `Enter URL, drop file to window or select file via button`
  String get newSearchHint {
    return Intl.message(
      'Enter URL, drop file to window or select file via button',
      name: 'newSearchHint',
      desc: 'Informs the user about possible search methods',
      args: [],
    );
  }

  /// `Enter image URL`
  String get enterImageUrl {
    return Intl.message(
      'Enter image URL',
      name: 'enterImageUrl',
      desc: 'Placeholder text in text form for pasting image URL',
      args: [],
    );
  }

  /// `Link should be direct to image`
  String get enterImageUrlHint {
    return Intl.message(
      'Link should be direct to image',
      name: 'enterImageUrlHint',
      desc: 'Hint text under text form for pasting image URL',
      args: [],
    );
  }

  /// `Search`
  String get searchButtonText {
    return Intl.message(
      'Search',
      name: 'searchButtonText',
      desc: 'Text on search button',
      args: [],
    );
  }

  /// `Select file`
  String get selectFileButtonText {
    return Intl.message(
      'Select file',
      name: 'selectFileButtonText',
      desc: 'Text on button for file selecting',
      args: [],
    );
  }

  /// `Open search`
  String get openSearchButton {
    return Intl.message(
      'Open search',
      name: 'openSearchButton',
      desc: 'Text on float action button that open search view',
      args: [],
    );
  }

  /// `Copy name`
  String get copyNameButton {
    return Intl.message(
      'Copy name',
      name: 'copyNameButton',
      desc: 'Text on copy name button',
      args: [],
    );
  }

  /// `Copied!`
  String get copiedText {
    return Intl.message(
      'Copied!',
      name: 'copiedText',
      desc: 'Show text with successful name copy',
      args: [],
    );
  }

  /// `No romaji name`
  String get noRomajiName {
    return Intl.message(
      'No romaji name',
      name: 'noRomajiName',
      desc: 'Indicates that there is no romaji name',
      args: [],
    );
  }

  /// `No japanese name`
  String get noJapaneseName {
    return Intl.message(
      'No japanese name',
      name: 'noJapaneseName',
      desc: 'Indicates that there is no japanese name',
      args: [],
    );
  }

  /// `View in anilist`
  String get viewInAnilist {
    return Intl.message(
      'View in anilist',
      name: 'viewInAnilist',
      desc: 'Text on view in anilist button',
      args: [],
    );
  }

  /// `Similarity: {similarityNum}%`
  String similarityText(String similarityNum) {
    return Intl.message(
      'Similarity: $similarityNum%',
      name: 'similarityText',
      desc: 'text showing the percentage of result match',
      args: [similarityNum],
    );
  }

  /// `Episode {episodeNumber}, moment at {momentTime}`
  String episodeText(int episodeNumber, String momentTime) {
    return Intl.message(
      'Episode $episodeNumber, moment at $momentTime',
      name: 'episodeText',
      desc: 'e.x: Episode 1, moment at 8m, 42s',
      args: [episodeNumber, momentTime],
    );
  }

  /// `Adult only!`
  String get adultOnly {
    return Intl.message(
      'Adult only!',
      name: 'adultOnly',
      desc: 'Indicates that this title is NSFW',
      args: [],
    );
  }

  /// `Provided image is empty`
  String get error400 {
    return Intl.message(
      'Provided image is empty',
      name: 'error400',
      desc: 'An error, indicates that provided image is empty',
      args: [],
    );
  }

  /// `Too many requests, please try again later`
  String get error402 {
    return Intl.message(
      'Too many requests, please try again later',
      name: 'error402',
      desc: 'An error, indicates too many requests by user',
      args: [],
    );
  }

  /// `Something wrong on server`
  String get error500 {
    return Intl.message(
      'Something wrong on server',
      name: 'error500',
      desc: 'An error, indicates something wrong on server',
      args: [],
    );
  }

  /// `Search queue is full`
  String get error503 {
    return Intl.message(
      'Search queue is full',
      name: 'error503',
      desc: 'An error, indicates search queue is full',
      args: [],
    );
  }

  /// `Server is overload, try again later`
  String get error504 {
    return Intl.message(
      'Server is overload, try again later',
      name: 'error504',
      desc: 'An error, indicates something wrong on server',
      args: [],
    );
  }

  /// `Response timed out`
  String get errorTimeOut {
    return Intl.message(
      'Response timed out',
      name: 'errorTimeOut',
      desc: 'response timed out error',
      args: [],
    );
  }

  /// `Unexpected error has occurred\nError: {error}`
  String errorUnexpected(Object error) {
    return Intl.message(
      'Unexpected error has occurred\nError: $error',
      name: 'errorUnexpected',
      desc: 'An error, indicates unexpected error has occurred',
      args: [error],
    );
  }

  /// `Something went wrong`
  String get errorUnknown {
    return Intl.message(
      'Something went wrong',
      name: 'errorUnknown',
      desc: 'An error, when something unknown went wrong',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
