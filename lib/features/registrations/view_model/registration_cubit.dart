import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:elections/core/constants/params.dart';
import 'package:elections/features/registrations/repository/base_registrations_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path/path.dart' as path;
import '../../../core/utls/utls.dart';
import '../models/registration_model.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<DataRegistrationState> {
  RegistrationCubit(this._baseRegistrationsRepository)
      : super(const DataRegistrationState());

  final BaseRegistrationsRepository _baseRegistrationsRepository;

  Future<void> createUserWithEmailAndPassword({
    required CreateUserParams createUserParams,
  }) async {
    emit(state.copyWith(registrationStatus: ValidationResponse.loading));
    final result = await _baseRegistrationsRepository
        .signUpWithEmailAndPassword(createUserParams);
    result.fold(
      (l) => emit(
        state.copyWith(
          errorMessage: l.message,
          registrationStatus: ValidationResponse.error,
        ),
      ),
      (r) {
        emit(state.copyWith(
            registrationStatus: ValidationResponse.userCreatedSuccess));
        uploadUserIdentityImage(
            UploadImageToStorageParams(
                uid: r.user!.uid,
                imageFile: state.image!,
                imageType: state.imageType),
            createUserParams,
            r);
      },
    );
  }

  Future<void> uploadUserIdentityImage(UploadImageToStorageParams params,
      CreateUserParams createUserParams, UserCredential userCredential) async {
    final result =
        await _baseRegistrationsRepository.uploadIdentityImage(params);

    result.fold(
        (l) => emit(state.copyWith(
            errorMessage: l.message,
            registrationStatus: ValidationResponse.error)), (r) {
      emit(
        state.copyWith(
          registrationStatus:
              ValidationResponse.userIdentityPhotoUploadedSuccess,
        ),
      );
      saveUserDataTofireStore(
          imageDownloadUrl: r,
          createUserParams: createUserParams,
          uid: userCredential.user!.uid);
    });
  }

  Future<void> saveUserDataTofireStore({
    required CreateUserParams createUserParams,
    required String imageDownloadUrl,
    required String uid,
  }) async {
    final saveUserToFireStoreModel = SaveUserToFireStoreModel(
      email: createUserParams.email,
      name: createUserParams.name,
      uid: uid,
      nationalNumber: createUserParams.nationalIdNumber,
      identityImageUrl: imageDownloadUrl,
    );
    final result = await _baseRegistrationsRepository
        .saveUserToFireStore(saveUserToFireStoreModel);
    result.fold(
      (l) => emit(state.copyWith(
          registrationStatus: ValidationResponse.error,
          errorMessage: l.message)),
      (r) => emit(
        state.copyWith(
          registrationStatus: ValidationResponse.registrationSuccess,
        ),
      ),
    );
  }

  void pickImage() async {
    try {
      Future<FilePickerResult?> filePicked =
          FilePicker.platform.pickFiles(type: FileType.image);
      FilePickerResult? result = await filePicked;
      if (result != null) {
        File file = File(result.files.single.path!);
        final imageType = path.extension(file.path);
        emit(state.copyWith(image: file, imageType: imageType));
      }
    } on Exception catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  void passwordVisibility() {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }
}
