import 'package:elections/core/constants/app_padding.dart';
import 'package:elections/core/constants/app_strings.dart';
import 'package:elections/core/constants/extensions.dart';
import 'package:elections/core/routes/app_routes_names.dart';
import 'package:elections/core/services/service_locator.dart';
import 'package:elections/features/registrations/view_model/registration_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/pick_image_widget.dart';
import '../widgets/registrations_button_widget.dart';
import '../widgets/registrations_text_fileds.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          serviceLocator<RegistrationCubit>()..checkUserIsSignedIn(),
      child: BlocListener<RegistrationCubit, DataRegistrationState>(
        listener: (context, state) {
          if (state.isUserSignedIn) {
            context.navigateToNamed(AppRoutesNames.home);
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
              padding: const EdgeInsets.all(AppPadding.p12),
              child: Column(
                children: const [
                  RegistrationsTextFields(),
                  PickImageWidget(),
                  RegistartionsButtonWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
