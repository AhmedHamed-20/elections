import 'package:elections/core/constants/app_strings.dart';
import 'package:elections/core/constants/extensions.dart';
import 'package:elections/core/widgets/default_button.dart';
import 'package:flutter/material.dart';

import '../widgets/registrations_text_fileds.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.registrations,
          style: context.theme.textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const RegistrationsTextFields(),
            DefaultTextButton(
              onPressed: () {},
              text: 'pick identity card image',
            ),
            DefaultButtonWithTextWidget(
              onPressed: () {},
              text: 'Register',
            )
          ],
        ),
      ),
    );
  }
}
