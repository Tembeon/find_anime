import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../../generated/l10n.dart';
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
            errorText = S().error400;
            break;
          case 429:
            errorText = S().error429;
            break;
          case 500:
            errorText = S().error500;
            break;
          default:
            errorText = S().errorUnknown;
            break;
        }
        emit(SearchState(status: SearchStatus.failure, errorText: errorText));
      }
    } on TimeoutException {
      emit(SearchState(
        status: SearchStatus.failure,
        errorText: S().errorTimeOut,
      ));
    } catch (e) {
      emit(SearchState(
        status: SearchStatus.failure,
        errorText: S().errorUnexpected(e),
      ));
      rethrow;
    }
  }

  void resetState() => emit(const SearchState());
}
