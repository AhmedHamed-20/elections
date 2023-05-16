import 'package:elections/core/constants/app_strings.dart';
import 'package:elections/core/constants/extensions.dart';
import 'package:elections/core/constants/params.dart';
import 'package:elections/core/controllers/text_fileds_controllers.dart';
import 'package:elections/core/widgets/default_button.dart';
import 'package:elections/features/registrations/view/widgets/sign_in_text_fields.dart';
import 'package:elections/features/registrations/view_model/registration_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInButtonDesign extends StatelessWidget {
  const SignInButtonDesign({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final registrationsCubit = BlocProvider.of<RegistrationCubit>(context);
    return SizedBox(
      width: context.width,
      child: DefaultButtonWithTextWidget(
        onPressed: () {
          if (signInFormKey.currentState!.validate()) {
            final signInUserParams = SignInUserParams(
              MainTextFieldsControllers.signInEmailController.text,
              MainTextFieldsControllers.signInPasswordController.text,
            );

            registrationsCubit.signInWithEmailAndPassword(
              signInUserParams,
            );
          }
        },
        text: AppStrings.signIn,
      ),
    );
  }
}
