import 'dart:async';
import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:mime/mime.dart';
import 'package:tracemoe_api/tracemoe_api.dart';
import 'package:tracemoe_repository/tracemoe_repository.dart';

import '../../generated/l10n.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._traceMoeRepository) : super(const SearchState());
  final TraceMoeRepository _traceMoeRepository;

  TextEditingController textController = TextEditingController();
  late DropzoneViewController dropzoneViewController;
  int pasteCount = 0;

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

    await _makeSearchByFile(bytes, mimeType);
  }

  Future<void> onPaste({
    Future<Uint8List?>? mediaBytes,
    Future<String?>? text,
  }) async {
    pasteCount++;

    if (pasteCount > 1) {
      // throw SearchQueueIsFullFailure();
    } else {
      Uint8List? imageBytes = await mediaBytes;
      String? copiedText = await text;

      if (imageBytes == null && text == null) {
        emit(const SearchState(status: SearchStatus.failure));
      } else {
        emit(const SearchState(status: SearchStatus.loading));
        imageBytes != null
            ? _makeSearchByFile(
                imageBytes,
                lookupMimeType('', headerBytes: imageBytes) ??
                    'application/octet-stream',
              )
            : _makeSearchByUrl(copiedText!);
      }
      // spam protection from pasting content
      Future.delayed(const Duration(milliseconds: 500))
          .then((value) => pasteCount = 0);
    }
  }

  Future<void> searchByUrl() async {
    emit(const SearchState(status: SearchStatus.loading));

    final String imageURL = textController.text;

    await _makeSearchByUrl(imageURL);
  }

  Future<void> _makeSearchByUrl(String imageURL) async {
    try {
      if (Uri.parse(imageURL).isAbsolute) {
        List<Result> resultList =
            await _traceMoeRepository.getResultByImageUrl(imageURL);

        emit(SearchState(
          status: SearchStatus.success,
          result: resultList,
        ));
      } else {
        throw InvalidImageUrlFailure();
      }
    } catch (e) {
      emit(SearchState(
        status: SearchStatus.failure,
        errorText: _getErrorText(e),
      ));
    }
  }

  Future<void> _makeSearchByFile(Uint8List bytes, String mimeType) async {
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
        errorText: _getErrorText(e),
      ));
    }
  }

  String _getErrorText(Object e) {
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

  void resetState() => emit(const SearchState());
}

class PasteMediaIntent extends Intent {
  const PasteMediaIntent({required this.mediaBytes, this.text});

  final Future<Uint8List?> mediaBytes;
  final Future<String?>? text;
}
