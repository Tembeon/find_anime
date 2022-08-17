import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dropzone_cubit.freezed.dart';

@freezed
class DropZoneState with _$DropZoneState {
  const DropZoneState._();

  DropzoneViewController? get getControllerOrNull => maybeWhen(
        createdController: (controller) => controller,
        orElse: () => null,
      );

  Future<Uint8List?> convertFile(Object htmlFile) async => maybeWhen(
        createdController: (controller) async =>
            await controller.getFileData(htmlFile),
        orElse: () => null,
      );

  const factory DropZoneState.initial() = _InitialState;

  const factory DropZoneState.createdController(
    DropzoneViewController controller,
  ) = _CreatedControllerDropZoneState;
}

class DropZoneCubit extends Cubit<DropZoneState> {
  DropZoneCubit() : super(const DropZoneState.initial());

  void setController(DropzoneViewController controller) {
    emit(DropZoneState.createdController(controller));
  }
}
