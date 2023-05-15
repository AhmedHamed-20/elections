import 'package:elections/core/constants/app_strings.dart';
import 'package:elections/core/constants/extensions.dart';
import 'package:elections/core/controllers/text_fileds_controllers.dart';
import 'package:flutter/material.dart';

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
      key: registrationsFormKey,
      child: Column(
        children: [
          DefaultTextField(
            controller: MainTextFieldsControllers.nameController,
            labelText: AppStrings.name,
            prefixIcon: Icon(
              Icons.text_fields,
              color: context.theme.iconTheme.color,
            ),
            keyboardType: TextInputType.name,
          ),
          DefaultTextField(
            controller: MainTextFieldsControllers.emailController,
            labelText: AppStrings.email,
            prefixIcon: Icon(
              Icons.email,
              color: context.theme.iconTheme.color,
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          DefaultTextField(
            controller: MainTextFieldsControllers.passwordController,
            labelText: AppStrings.password,
            prefixIcon: Icon(
              Icons.password,
              color: context.theme.iconTheme.color,
            ),
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.remove_red_eye,
              ),
            ),
            keyboardType: TextInputType.visiblePassword,
          ),
          DefaultTextField(
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
    MainTextFieldsControllers.emailController = TextEditingController();
    MainTextFieldsControllers.passwordController = TextEditingController();
    MainTextFieldsControllers.nationalIdController = TextEditingController();
  }

  void disposeTextEditingControllers() {
    MainTextFieldsControllers.nameController.dispose();
    MainTextFieldsControllers.emailController.dispose();
    MainTextFieldsControllers.passwordController.dispose();
    MainTextFieldsControllers.nationalIdController.dispose();
  }
}
