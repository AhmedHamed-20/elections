import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elections/core/constants/app_colors.dart';
import 'package:elections/core/constants/app_strings.dart';
import 'package:elections/core/constants/params.dart';
import 'package:elections/features/registrations/repository/base_registrations_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;

import '../../../core/constants/constant.dart';
import '../../../core/utls/utls.dart';
import '../models/registration_model.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<DataRegistrationState> {
  RegistrationCubit(this._baseRegistrationsRepository)
      : super(const DataRegistrationState());

  final BaseRegistrationsRepository _baseRegistrationsRepository;

  Future<void> checkUserIsSignedIn() async {
    final result = await _baseRegistrationsRepository.checkUserIsSignedIn();
    result.fold(
        (l) => emit(state.copyWith(
            isSignedInRequestStatus: BaseRequestStatus.error,
            isUserSignedIn: false,
            errorMessage: l.message)), (r) {
      if (r != null) {
        emit(state.copyWith(
            isSignedInRequestStatus: BaseRequestStatus.success,
            isUserSignedIn: true));
        Constants.uid = r.uid;
      } else {
        emit(state.copyWith(
            isSignedInRequestStatus: BaseRequestStatus.success,
            isUserSignedIn: false));
      }
    });
  }

  Future<void> createUserWithEmailAndPassword({
    required CreateUserParams createUserParams,
  }) async {
    if (await checkIfNationalIdTaken(createUserParams.nationalIdNumber)) {
      Constants.showToast(
          message: AppStrings.thisNationalIdIsAlreadyTaken,
          backgroundColor: AppColors.toastErrorColor,
          textColor: Colors.white);
    } else {
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
    final saveUserToFireStoreModel = FireStoreUserDataModel(
      email: createUserParams.email,
      name: createUserParams.name,
      uid: uid,
      nationalNumber: createUserParams.nationalIdNumber,
      identityImageUrl: imageDownloadUrl,
      isVote: false,
    );
    final result = await _baseRegistrationsRepository
        .saveUserToFireStore(saveUserToFireStoreModel);
    result.fold(
        (l) => emit(state.copyWith(
            registrationStatus: ValidationResponse.error,
            errorMessage: l.message)), (r) {
      emit(
        state.copyWith(
          registrationStatus: ValidationResponse.registrationSuccess,
        ),
      );
      Constants.uid = uid;
    });
  }

  void pickImage() async {
    try {
      Future<FilePickerResult?> filePicked =
          FilePicker.platform.pickFiles(type: FileType.image);
      FilePickerResult? result = await filePicked;
      //check image size if it is less than 2 MB

      if (result != null && result.files.single.size < 5000000) {
        File file = File(result.files.single.path!);
        final imageType = path.extension(file.path);
        emit(state.copyWith(image: file, imageType: imageType));
      } else if (result != null && result.files.single.size > 5000000) {
        Constants.showToast(
            message: AppStrings.imageSizeIsTooLarge,
            backgroundColor: AppColors.toastErrorColor,
            textColor: Colors.white);
      }
    } on Exception catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  void changeSignInPasswordVisibility() {
    emit(state.copyWith(
        isSignInPasswordInVisible: !state.isSignInPasswordInVisible));
  }

  void changeRegistrationsPasswordVisibility() {
    emit(state.copyWith(
        isRegistrationsPasswordInVisible:
            !state.isRegistrationsPasswordInVisible));
  }

  Future<QuerySnapshot<Map<String, dynamic>>?> getUsersDocs() async {
    QuerySnapshot<Map<String, dynamic>>? user;
    final docs = await _baseRegistrationsRepository
        .getAllUsersDoc(AppStrings.collectionUsers);
    docs.fold(
        (l) => emit(state.copyWith(
              errorMessage: l.message,
            )),
        (r) => user = r);
    return user;
  }

  Future<bool> checkIfNationalIdTaken(int nationalId) async {
    bool isTaken = false;
    final value = await getUsersDocs();

    if (value != null) {
      for (var element in value.docs) {
        if (element.data()[AppStrings.nationalNumberKey] == nationalId) {
          isTaken = true;
        }
      }
    }
    return isTaken;
  }

  Future<void> signInWithEmailAndPassword(
      SignInUserParams signInUserParams) async {
    emit(state.copyWith(
        signInRequestStatus: BaseRequestStatusWithIdleState.loading));
    final result = await _baseRegistrationsRepository
        .signInWithEmailAndPassword(signInUserParams);

    result.fold(
        (l) => emit(state.copyWith(
            errorMessage: l.message,
            signInRequestStatus: BaseRequestStatusWithIdleState.error)), (r) {
      emit(state.copyWith(
          signInRequestStatus: BaseRequestStatusWithIdleState.success));
      Constants.uid = r.user!.uid;
    });
  }
}
