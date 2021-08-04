import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

import '../models/result.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchState());

  Future<void> searchByUrl(String imageURL) async {
    emit(SearchState(status: SearchStatus.loading));

    const String SEARCH_BY_URL =
        'https://api.trace.moe/search?anilistInfo&url=';
    try {
      http.Response response = await http
          .get(Uri.parse(SEARCH_BY_URL + imageURL))
          .timeout(Duration(seconds: 70));
      if (response.statusCode == 200) {
        Map<String, dynamic> resultMap = jsonDecode(response.body);
        List<dynamic> data = resultMap['result'];
        List<Result> resultData = data.map((e) => Result.fromJson(e)).toList();
        emit(SearchState(status: SearchStatus.success, result: resultData));
      } else {
        emit(SearchState(status: SearchStatus.failure));
      }
    } on TimeoutException {
      emit(SearchState(status: SearchStatus.failure));
    } catch (e) {
      emit(SearchState(status: SearchStatus.failure));
      rethrow;
    }
  }

  void resetState() => emit(SearchState());

}
