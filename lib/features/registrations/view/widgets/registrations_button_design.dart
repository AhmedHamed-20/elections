import 'package:elections/core/constants/app_colors.dart';
import 'package:elections/core/constants/app_strings.dart';
import 'package:elections/core/constants/constant.dart';
import 'package:elections/core/constants/params.dart';
import 'package:elections/core/controllers/text_fileds_controllers.dart';
import 'package:elections/core/widgets/default_button.dart';
import 'package:elections/features/registrations/view/widgets/registrations_text_fileds.dart';
import 'package:elections/features/registrations/view_model/registration_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistartionsButtonDesign extends StatelessWidget {
  const RegistartionsButtonDesign({super.key, required this.isImagePicked});
  final bool isImagePicked;
  @override
  Widget build(BuildContext context) {
    final registrationsCubit = BlocProvider.of<RegistrationCubit>(context);
    return DefaultButtonWithTextWidget(
        onPressed: () {
          if (registrationsFormKey.currentState!.validate() && isImagePicked) {
            final createUserParams = CreateUserParams(
              email:
                  MainTextFieldsControllers.registrationsEmailController.text,
              password: MainTextFieldsControllers
                  .registrationsPasswordController.text,
              name: MainTextFieldsControllers.nameController.text,
              nationalIdNumber: int.parse(
                  MainTextFieldsControllers.nationalIdController.text),
            );

            registrationsCubit.createUserWithEmailAndPassword(
              createUserParams: createUserParams,
            );
          } else if (isImagePicked == false) {
            Constants.showToast(
                message: AppStrings.pleasePickImage,
                backgroundColor: AppColors.toastWarningColor,
                textColor: Colors.black);
          }
        },
        text: AppStrings.register);
  }
}
