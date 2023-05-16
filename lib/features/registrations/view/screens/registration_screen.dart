import 'package:elections/core/constants/app_padding.dart';
import 'package:elections/core/constants/app_strings.dart';
import 'package:elections/core/constants/extensions.dart';
import 'package:elections/core/routes/app_routes_names.dart';
import 'package:elections/features/registrations/view_model/registration_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_assets_path.dart';
import '../widgets/already_have_an_account_widget.dart';
import '../widgets/pick_image_widget.dart';
import '../widgets/registrations_button_widget.dart';
import '../widgets/registrations_text_fileds.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegistrationCubit, DataRegistrationState>(
      listener: (context, state) {
        if (state.isUserSignedIn) {
          context.navigateToAndRemoveUntilNamed(AppRoutesNames.home);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppStrings.registrations,
            style: context.theme.textTheme.titleMedium,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: Column(
              children: [
                Image.asset(AppAssetsPath.signUpAssetPath),
                const RegistrationsTextFields(),
                const PickImageWidget(),
                const RegistartionsButtonWidget(),
                const AleardyHaveAnAccountWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
