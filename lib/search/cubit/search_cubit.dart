import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../models/search_result_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(const SearchState());

  TextEditingController controller = TextEditingController();

  Future<void> searchByUrl() async {
    emit(const SearchState(status: SearchStatus.loading));

    const String baseURL = 'https://api.trace.moe/search?anilistInfo&url=';
    final String imageURL = controller.text;

    try {
      http.Response response = await http
          .get(Uri.parse(baseURL + imageURL))
          .timeout(const Duration(seconds: 70));

      if (response.statusCode == 200) {
        SearchResultModel searchResultModel =
            SearchResultModel.fromJson(jsonDecode(response.body));

        emit(SearchState(
          status: SearchStatus.success,
          result: searchResultModel.result!,
        ));
      } else {
        String errorText;
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
        status: SearchStatus.failure,
        errorText: 'Response timed out',
      ));
    } catch (e) {
      emit(const SearchState(
        status: SearchStatus.failure,
        errorText: 'Unexpected error has occurred',
      ));
      rethrow;
    }
  }

  void resetState() => emit(const SearchState());
}
