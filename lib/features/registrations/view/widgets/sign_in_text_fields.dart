import 'package:elections/core/constants/app_strings.dart';
import 'package:elections/core/constants/extensions.dart';
import 'package:elections/core/controllers/text_fileds_controllers.dart';
import 'package:elections/core/validationHelper/validation_helper.dart';
import 'package:elections/core/widgets/default_text_filed.dart';
import 'package:elections/features/registrations/view_model/registration_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();

class SignInTextFields extends StatefulWidget {
  const SignInTextFields({super.key});

  @override
  State<SignInTextFields> createState() => _SignInTextFieldsState();
}

class _SignInTextFieldsState extends State<SignInTextFields> {
  @override
  void initState() {
    super.initState();
    initSignInTextFieldsControllers();
  }

  @override
  void dispose() {
    disposeSignInTextFieldsControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final registartionsCubit = BlocProvider.of<RegistrationCubit>(context);
    return Form(
        key: signInFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            DefaultTextFormField(
              validator: (value) =>
                  ValidationHelper.validateEmail(value: value),
              controller: MainTextFieldsControllers.signInEmailController,
              labelText: AppStrings.email,
              prefixIcon: Icon(
                Icons.email,
                color: context.theme.iconTheme.color,
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            BlocBuilder<RegistrationCubit, DataRegistrationState>(
              builder: (context, state) => DefaultTextFormField(
                validator: (value) =>
                    ValidationHelper.validatePassword(value: value),
                controller: MainTextFieldsControllers.signInPasswordController,
                labelText: AppStrings.password,
                obscureText: state.isSignInPasswordInVisible,
                suffixIcon: IconButton(
                  onPressed: () {
                    registartionsCubit.changeSignInPasswordVisibility();
                  },
                  icon: Icon(
                    state.isSignInPasswordInVisible
                        ? Icons.remove_red_eye
                        : Icons.remove_red_eye_outlined,
                  ),
                ),
                prefixIcon: Icon(
                  Icons.password,
                  color: context.theme.iconTheme.color,
                ),
                keyboardType: TextInputType.visiblePassword,
              ),
            ),
          ],
        ));
  }

  void initSignInTextFieldsControllers() {
    MainTextFieldsControllers.signInEmailController = TextEditingController();
    MainTextFieldsControllers.signInPasswordController =
        TextEditingController();
  }

  void disposeSignInTextFieldsControllers() {
    MainTextFieldsControllers.signInEmailController.dispose();
    MainTextFieldsControllers.signInPasswordController.dispose();
  }
}
