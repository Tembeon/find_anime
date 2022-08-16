import 'dart:typed_data';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mime/mime.dart';
import 'package:tracemoe_api/tracemoe_api.dart';
import 'package:tracemoe_repository/tracemoe_repository.dart';

import '../../../core/generated/localization/l10n.dart';

part 'search_bloc.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const SearchState._();

  /// Initial state of screen
  const factory SearchState.initial() = _InitialSearchState;

  /// Loading data
  const factory SearchState.loading() = _LoadingSearchState;

  /// Users input (file or url) is incorrect
  const factory SearchState.userInputFailure(String message) =
      _UserInputFailureSearchState;

  /// Something went from
  const factory SearchState.failure({
    @Default('An error has occurred') String message,
  }) = _FailureSearchState;

  /// Show result
  const factory SearchState.showingResult(List<Result> result) =
      _ShowingResultSearchState;
}

@freezed
class SearchEvent with _$SearchEvent {
  const SearchEvent._();

  /// User want to search via image url
  const factory SearchEvent.searchViaDirectUrl(String imageUrl) =
      _SearchViaDirectUrlSearchEvent;

  /// User want to search via file
  const factory SearchEvent.searchViaFile(Uint8List bytes) =
      _SearchViaFileSearchEvent;

  /// User want to open search (e.x. from result)
  const factory SearchEvent.openSearch() = _OpenSearchSearchEvent;

  /// User pasted some content (url or file)
  const factory SearchEvent.pastedContent(
    Future<Uint8List?>? mediaBytes,
    Future<String?>? text,
  ) = _PastedContentSearchEvent;
}

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final TraceMoeRepository _repository;

  SearchBloc(TraceMoeRepository repository)
      : _repository = repository,
        super(const SearchState.initial()) {
    on<SearchEvent>(
      (event, emit) => event.map<Future<void>>(
        searchViaDirectUrl: (event) => _searchViaDirectUrl(event, emit),
        searchViaFile: (event) => _searchViaFile(event, emit),
        openSearch: (event) => _openSearch(event, emit),
        pastedContent: (event) => _pastedContent(event, emit),
      ),
      transformer: droppable<SearchEvent>(),
    );
  }

  /// Starts search via image url
  Future<void> _searchViaDirectUrl(
    _SearchViaDirectUrlSearchEvent event,
    Emitter<SearchState> emitter,
  ) async {
    emitter(const SearchState.loading());

    try {
      final List<Result> resultList = await __makeSearchByUrl(event.imageUrl);

      return emitter(SearchState.showingResult(resultList));
    } on InvalidImageUrlFailure {
      emitter(const SearchState.userInputFailure('Entered URL is not direct'));
    } on Object catch (e, _) {
      emitter(const SearchState.failure(message: 'Something went wrong'));
      rethrow;
    }
  }

  /// Starts search via file
  Future<void> _searchViaFile(
    _SearchViaFileSearchEvent event,
    Emitter<SearchState> emitter,
  ) async {
    emitter(const SearchState.loading());

    try {
      final List<Result> resultList = await __makeSearchByFile(event.bytes);

      return emitter(SearchState.showingResult(resultList));
    } on InvalidImageUrlFailure {
      return emitter(
        const SearchState.userInputFailure('Cant search with given file'),
      );
    } on Object {
      emitter(
        const SearchState.userInputFailure('Something went wrong'),
      );
      rethrow;
    }
  }

  /// Opens search view via resetting state
  Future<void> _openSearch(
    _OpenSearchSearchEvent event,
    Emitter<SearchState> emitter,
  ) async {
    emitter(const SearchState.initial());
  }

  /// Makes search via file or url depend on pasted content
  Future<void> _pastedContent(
    _PastedContentSearchEvent event,
    Emitter<SearchState> emitter,
  ) async {
    // show loading while reading data from clipboard
    emitter(const SearchState.loading());

    // we do not know what user pasted
    final Uint8List? bytes = await event.mediaBytes;
    final String? url = await event.text;

    if (bytes == null && url == null) {
      return emitter(
        const SearchState.failure(
          message: 'Error while reading clipboard',
        ),
      );
    } else {
      try {
        final List<Result> resultList = await (url != null
            ? __makeSearchByUrl(url)
            : __makeSearchByFile(bytes!)); // only one item can be null

        return emitter(SearchState.showingResult(resultList));
      } on InvalidImageUrlFailure {
        emitter(
          SearchState.failure(
            message: 'Pasted content cannot be proceed\n\n'
                'Url: $url\n\nDetected file: ${bytes != null}',
          ),
        );
      } on Object {
        emitter(const SearchState.failure());
        rethrow;
      }
    }
  }

  /// Perform search via image url.
  ///
  /// Will throw [InvalidImageUrlFailure] if imageUrl is not absolute
  Future<List<Result>> __makeSearchByUrl(String imageURL) async {
    if (Uri.parse(imageURL).isAbsolute) {
      List<Result> resultList = await _repository.getResultByImageUrl(imageURL);

      return resultList;
    } else {
      throw InvalidImageUrlFailure();
    }
  }

  /// Perform search via file.
  ///
  /// Media can be an **image/\***, **video/\*** or **gif**.
  /// If a different file type is sent, [InvalidImageUrlFailure] will be thrown.
  ///
  /// May throw exceptions according to the API documentation:
  /// https://soruly.github.io/trace.moe-api/#/docs?id=error-codes
  Future<List<Result>> __makeSearchByFile(
    Uint8List bytes,
  ) async {
    String mimeType = lookupMimeType(
          '', // no path for file, look for mime with bytes
          headerBytes: bytes,
        ) ??
        'application/octet-stream';

    List<Result> resultList = await _repository.getResultByFile(
      bytes,
      mimeType: mimeType,
    );

    return resultList;
  }

  /// Use for get localed text for error description
  String __getErrorText(Object e) {
    if (e is InvalidImageUrlFailure) {
      return S().error400;
    } else if (e is SearchQuotaDepletedFailure) {
      return S().error402;
    } else if (e is SearchInternalErrorFailure) {
      return S().error500;
    } else if (e is SearchQueueIsFullFailure) {
      return S().error503;
    } else if (e is SearchServerOverloadFailure) {
      return S().error504;
    } else {
      return S().errorUnknown;
    }
  }
}
