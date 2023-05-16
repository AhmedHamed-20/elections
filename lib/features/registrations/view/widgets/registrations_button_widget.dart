import 'package:elections/core/constants/constant.dart';
import 'package:elections/core/constants/extensions.dart';
import 'package:elections/core/routes/app_routes_names.dart';
import 'package:elections/features/registrations/view/widgets/registrations_button_design.dart';
import 'package:elections/features/registrations/view_model/registration_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/utls/utls.dart';

class RegistartionsButtonWidget extends StatelessWidget {
  const RegistartionsButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistrationCubit, DataRegistrationState>(
      listener: (context, state) {
        if (state.registrationStatus ==
            ValidationResponse.registrationSuccess) {
          Constants.showToast(
              message: 'success',
              backgroundColor: AppColors.toastSuccessColor,
              textColor: Colors.white);

          context.navigateToNamed(AppRoutesNames.home);
        } else if (state.registrationStatus == ValidationResponse.error) {
          Constants.showToast(
              message: state.errorMessage,
              backgroundColor: AppColors.toastErrorColor,
              textColor: Colors.white);
        }
      },
      builder: (context, state) {
        switch (state.registrationStatus) {
          case ValidationResponse.idle:
            return RegistartionsButtonDesign(
              isImagePicked: state.image == null ? false : true,
            );
          case ValidationResponse.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ValidationResponse.userCreatedSuccess:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ValidationResponse.userIdentityPhotoUploadedSuccess:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ValidationResponse.userDataSavedToFireStoreSuccess:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ValidationResponse.registrationSuccess:
            return RegistartionsButtonDesign(
              isImagePicked: state.image == null ? false : true,
            );
          case ValidationResponse.error:
            return RegistartionsButtonDesign(
              isImagePicked: state.image == null ? false : true,
            );
        }
      },
    );
  }
}
