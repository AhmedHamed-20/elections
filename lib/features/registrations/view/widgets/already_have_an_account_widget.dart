import 'package:elections/core/constants/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/routes/app_routes_names.dart';
import '../../view_model/registration_cubit.dart';

class AleardyHaveAnAccountWidget extends StatelessWidget {
  const AleardyHaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final resgistrationCubit = BlocProvider.of<RegistrationCubit>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.alreadyHaveAnAccount,
          style: context.theme.textTheme.titleSmall,
        ),
        TextButton(
          onPressed: () {
            context.navigateToNamed(AppRoutesNames.signIn,
                arguments: resgistrationCubit);
          },
          child: Text(
            AppStrings.signIn,
            style: context.theme.textTheme.titleSmall?.copyWith(
              color: context.theme.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
