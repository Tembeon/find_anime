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
    this.result = const <dynamic>[],
  });

  final SearchStatus status;
  final List<dynamic> result;

  SearchState copyWith({
    SearchStatus? status,
    List<dynamic>? result,
  }) {
    return SearchState(
        status: status ?? this.status, result: result ?? this.result);
  }

  @override
  List<Object?> get props => [status, result];
}
