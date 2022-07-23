import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracemoe_api/tracemoe_api.dart';
import 'package:tracemoe_repository/tracemoe_repository.dart';

import '../../generated/l10n.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._traceMoeRepository) : super(const SearchState());
  final TraceMoeRepository _traceMoeRepository;

  TextEditingController controller = TextEditingController();

  Future<void> searchByUrl() async {
    emit(const SearchState(status: SearchStatus.loading));

    final String imageURL = controller.text;

    try {
      List<Result> resultList =
          await _traceMoeRepository.getResultByImageUrl(imageURL);

      emit(SearchState(
        status: SearchStatus.success,
        result: resultList,
      ));
    } catch (e) {
      String errorText;
      switch (e) {
        case InvalidImageUrlFailure:
          errorText = S().error400;
          break;
        case SearchQuotaDepletedFailure:
          errorText = S().error402;
          break;
        case SearchInternalErrorFailure:
          errorText = S().error500;
          break;
        case SearchQueueIsFullFailure:
          errorText = S().error503;
          break;
        case SearchServerOverloadFailure:
          errorText = S().error504;
          break;
        default:
          errorText = S().errorUnknown;
      }
      emit(SearchState(status: SearchStatus.failure, errorText: errorText));
    }
  }

  void resetState() => emit(const SearchState());
}
