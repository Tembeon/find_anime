import 'dart:async';
import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:tracemoe_api/tracemoe_api.dart';
import 'package:tracemoe_repository/tracemoe_repository.dart';

import '../../generated/l10n.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._traceMoeRepository) : super(const SearchState());
  final TraceMoeRepository _traceMoeRepository;

  TextEditingController controller = TextEditingController();
  late DropzoneViewController dropzoneViewController;

  void setFileController(DropzoneViewController newController) =>
      dropzoneViewController = newController;

  Future<void> selectFile() async {
    var htmlFile = (await dropzoneViewController.pickFiles()).first;
    searchByFile(htmlFile);
  }

  Future<void> searchByFile(dynamic file) async {
    emit(const SearchState(status: SearchStatus.loading));

    Uint8List bytes = await dropzoneViewController.getFileData(file);
    String mimeType = await dropzoneViewController.getFileMIME(file);

    try {
      List<Result> resultList = await _traceMoeRepository.getResultByFile(
        bytes,
        mimeType: mimeType,
      );

      emit(SearchState(
        status: SearchStatus.success,
        result: resultList,
      ));
    } catch (e) {
      emit(SearchState(
        status: SearchStatus.failure,
        errorText: getErrorText(e),
      ));
    }
  }

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
      emit(SearchState(
        status: SearchStatus.failure,
        errorText: getErrorText(e),
      ));
    }
  }

  String getErrorText(Object e) {
    switch (e) {
      case InvalidImageUrlFailure:
        return S().error400;
      case SearchQuotaDepletedFailure:
        return S().error402;
      case SearchInternalErrorFailure:
        return S().error500;
      case SearchQueueIsFullFailure:
        return S().error503;
      case SearchServerOverloadFailure:
        return S().error504;
      default:
        return S().errorUnknown;
    }
  }

  void resetState() => emit(const SearchState());
}
