import 'package:elections/core/constants/constant.dart';
import 'package:elections/core/constants/extensions.dart';
import 'package:elections/core/routes/app_routes_names.dart';
import 'package:elections/features/registrations/view/widgets/sign_in_button_design_widget.dart';
import 'package:elections/features/registrations/view_model/registration_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/utls/utls.dart';

class SignInButtonWidget extends StatelessWidget {
  const SignInButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistrationCubit, DataRegistrationState>(
      listener: (context, state) {
        if (state.signInRequestStatus ==
            BaseRequestStatusWithIdleState.success) {
          Constants.showToast(
              message: 'success',
              backgroundColor: AppColors.toastSuccessColor,
              textColor: Colors.white);

          context.navigateToAndRemoveUntilNamed(AppRoutesNames.home);
        } else if (state.signInRequestStatus ==
            BaseRequestStatusWithIdleState.error) {
          Constants.showToast(
              message: state.errorMessage,
              backgroundColor: AppColors.toastErrorColor,
              textColor: Colors.white);
        }
      },
      builder: (context, state) {
        switch (state.signInRequestStatus) {
          case BaseRequestStatusWithIdleState.idle:
            return const SignInButtonDesign();
          case BaseRequestStatusWithIdleState.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case BaseRequestStatusWithIdleState.success:
            return const SignInButtonDesign();
          case BaseRequestStatusWithIdleState.error:
            return const SignInButtonDesign();
        }
      },
    );
  }
}
