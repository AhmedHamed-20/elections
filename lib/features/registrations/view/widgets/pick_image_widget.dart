import 'package:elections/core/constants/app_elavation.dart';
import 'package:elections/core/constants/app_radius.dart';
import 'package:elections/core/constants/app_strings.dart';
import 'package:elections/core/constants/extensions.dart';
import 'package:elections/core/widgets/default_button.dart';
import 'package:elections/features/registrations/view_model/registration_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final registrationCubit = BlocProvider.of<RegistrationCubit>(context);
    return BlocBuilder<RegistrationCubit, DataRegistrationState>(
        builder: (context, state) {
      if (state.image != null) {
        return Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadius.r10)),
              elevation: AppElevation.eL4,
              child: Image.file(
                state.image!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200.h,
              ),
            ),
            SizedBox(
              height: context.height * 0.1,
            ),
            DefaultButtonWithTextWidget(
                onPressed: () {
                  registrationCubit.pickImage();
                },
                text: AppStrings.pickAnotherImage)
          ],
        );
      } else {
        return DefaultButtonWithTextWidget(
          onPressed: () {
            registrationCubit.pickImage();
          },
          text: AppStrings.pickImage,
        );
      }
    });
  }
}
