import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';

import '../../../core/utls/utls.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<DataRegistrationState> {
  RegistrationCubit() : super(const DataRegistrationState());
  void pickImage() async {
    try {
      Future<FilePickerResult?> filePicked =
          FilePicker.platform.pickFiles(type: FileType.image);
      FilePickerResult? result = await filePicked;
      if (result != null) {
        File file = File(result.files.single.path!);
        emit(state.copyWith(image: file));
      }
    } on Exception catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  void passwordVisibility() {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }
}
