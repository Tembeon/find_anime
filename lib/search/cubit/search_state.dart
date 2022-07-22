part of 'search_cubit.dart';

enum SearchStatus {
  initial,
  loading,
  success,
  failure,
}

class SearchState extends Equatable {
  const SearchState({
    this.status = SearchStatus.initial,
    this.result = const <ResultModel>[],
    this.errorText,
  });

  final SearchStatus status;
  final List<ResultModel> result;
  final String? errorText;

  SearchState copyWith({
    SearchStatus? status,
    List<ResultModel>? result,
    String? errorText,
  }) {
    return SearchState(
      status: status ?? this.status,
      result: result ?? this.result,
      errorText: errorText ?? this.errorText,
    );
  }

  @override
  List<Object?> get props => [status, result];
}
