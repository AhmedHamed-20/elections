import 'package:bloc/bloc.dart';
import 'package:elections/features/elections/models/elections_model.dart';
import 'package:elections/features/elections/repository/base_elections_repository.dart';
import 'package:elections/features/registrations/models/registration_model.dart';
import 'package:equatable/equatable.dart';

import '../../../core/constants/params.dart';
import '../../../core/utls/utls.dart';

part 'elections_state.dart';

class ElectionsCubit extends Cubit<ElectionsState> {
  ElectionsCubit(this._electionsRepository) : super(const ElectionsState());
  final BaseElectionsRepository _electionsRepository;

  Future<void> getAvailableElections() async {
    final result = await _electionsRepository.getAvailableElections();
    result.fold(
      (failure) => emit(state.copyWith(
        getAvailableElectionsStatus: BaseRequestStatus.error,
        errorMessage: failure.message,
      )),
      (electionsModel) => emit(state.copyWith(
        getAvailableElectionsStatus: BaseRequestStatus.success,
        electionsModel: electionsModel,
      )),
    );
  }

  Future<void> electionVote(ElectionVoteParam electionVoteParam) async {
    emit(state.copyWith(
      electionVoteStatus: BaseRequestStatusWithIdleState.loading,
    ));
    final result = await _electionsRepository.electionVote(electionVoteParam);
    result.fold(
        (failure) => emit(state.copyWith(
              electionVoteStatus: BaseRequestStatusWithIdleState.error,
              errorMessage: failure.message,
            )), (_) {
      final updatedSignedInUser = state.signedInUser!.copyWith(
        isVote: true,
      );
      emit(state.copyWith(
          electionVoteStatus: BaseRequestStatusWithIdleState.success,
          signedInUser: updatedSignedInUser));
      updateSignedInUserVoteStatus(updatedSignedInUser);
    });
  }

  Future<void> getSignedInUserFromFireStore(String uid) async {
    final result =
        await _electionsRepository.getSignedInUserDataFromFireStore(uid);
    result.fold(
      (failure) => emit(state.copyWith(
          errorMessage: failure.message,
          getSignedInUserStatus: BaseRequestStatus.error)),
      (user) => emit(state.copyWith(
          signedInUser: user,
          getSignedInUserStatus: BaseRequestStatus.success)),
    );
  }

  Future<void> updateSignedInUserVoteStatus(
      FireStoreUserDataModel newUserData) async {
    final result =
        await _electionsRepository.updateSignedInUserVoteStatus(newUserData);
    result.fold(
        (failure) => emit(state.copyWith(
              errorMessage: failure.message,
            )),
        (_) {});
  }
}
