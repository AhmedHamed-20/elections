import 'package:elections/core/constants/app_strings.dart';
import 'package:elections/core/constants/extensions.dart';
import 'package:elections/core/controllers/text_fileds_controllers.dart';
import 'package:elections/features/registrations/view_model/registration_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/validationHelper/validation_helper.dart';
import '../../../../core/widgets/default_text_filed.dart';

final GlobalKey<FormState> registrationsFormKey = GlobalKey<FormState>();

class RegistrationsTextFields extends StatefulWidget {
  const RegistrationsTextFields({super.key});

  @override
  State<RegistrationsTextFields> createState() =>
      _RegistrationsTextFieldsState();
}

class _RegistrationsTextFieldsState extends State<RegistrationsTextFields> {
  @override
  void initState() {
    super.initState();
    initTextEditingControllers();
  }

  @override
  void dispose() {
    disposeTextEditingControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: registrationsFormKey,
      child: Column(
        children: [
          DefaultTextFormField(
            validator: (value) => ValidationHelper.validateName(value: value),
            controller: MainTextFieldsControllers.nameController,
            labelText: AppStrings.name,
            prefixIcon: Icon(
              Icons.text_fields,
              color: context.theme.iconTheme.color,
            ),
            keyboardType: TextInputType.name,
          ),
          DefaultTextFormField(
            validator: (value) => ValidationHelper.validateEmail(value: value),
            controller: MainTextFieldsControllers.registrationsEmailController,
            labelText: AppStrings.email,
            prefixIcon: Icon(
              Icons.email,
              color: context.theme.iconTheme.color,
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          BlocBuilder<RegistrationCubit, DataRegistrationState>(
              builder: (context, state) {
            final registrationCubit =
                BlocProvider.of<RegistrationCubit>(context);
            return DefaultTextFormField(
              validator: (value) =>
                  ValidationHelper.validatePassword(value: value),
              controller:
                  MainTextFieldsControllers.registrationsPasswordController,
              labelText: AppStrings.password,
              prefixIcon: Icon(
                Icons.password,
                color: context.theme.iconTheme.color,
              ),
              obscureText: state.isRegistrationsPasswordInVisible,
              suffixIcon: IconButton(
                onPressed: () {
                  registrationCubit.changeSignInPasswordVisibility();
                },
                icon: Icon(
                  state.isRegistrationsPasswordInVisible
                      ? Icons.remove_red_eye
                      : Icons.remove_red_eye_outlined,
                ),
              ),
              keyboardType: TextInputType.visiblePassword,
            );
          }),
          DefaultTextFormField(
            validator: (value) =>
                ValidationHelper.validateNationalId(value: value),
            controller: MainTextFieldsControllers.nationalIdController,
            labelText: AppStrings.nationalId,
            prefixIcon: Icon(
              Icons.numbers,
              color: context.theme.iconTheme.color,
            ),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }

  void initTextEditingControllers() {
    MainTextFieldsControllers.nameController = TextEditingController();
    MainTextFieldsControllers.registrationsEmailController =
        TextEditingController();
    MainTextFieldsControllers.registrationsPasswordController =
        TextEditingController();
    MainTextFieldsControllers.nationalIdController = TextEditingController();
  }

  void disposeTextEditingControllers() {
    MainTextFieldsControllers.nameController.dispose();
    MainTextFieldsControllers.registrationsEmailController.dispose();
    MainTextFieldsControllers.registrationsPasswordController.dispose();
    MainTextFieldsControllers.nationalIdController.dispose();
  }
}
