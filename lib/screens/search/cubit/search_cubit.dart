import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

import '../models/result.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(const SearchState());

  Future<void> searchByUrl(String imageURL) async {
    emit(const SearchState(status: SearchStatus.loading));

    const String baseURL =
        'https://api.trace.moe/search?anilistInfo&url=';
    try {
      http.Response response = await http
          .get(Uri.parse(baseURL + imageURL))
          .timeout(const Duration(seconds: 70));
      if (response.statusCode == 200) {
        Map<String, dynamic> resultMap = jsonDecode(response.body);
        List<dynamic> data = resultMap['result'];
        List<Result> resultData = data.map((e) => Result.fromJson(e)).toList();
        emit(SearchState(status: SearchStatus.success, result: resultData));
      } else {
        late String errorText;
        switch (response.statusCode) {
          case 400:
            errorText = 'Provided image is empty';
            break;
          case 429:
            errorText = 'Too many requests, please try again later';
            break;
          case 500:
            errorText = 'Something wrong on server';
            break;
          default:
            errorText = 'Something went wrong';
            break;
        }
        emit(SearchState(status: SearchStatus.failure, errorText: errorText));
      }
    } on TimeoutException {
      emit(const SearchState(
          status: SearchStatus.failure, errorText: 'Response timed out'));
    } catch (e) {
      emit(const SearchState(
          status: SearchStatus.failure,
          errorText: 'Unexpected error has occurred'));
      rethrow;
    }
  }

  void resetState() => emit(const SearchState());
}
