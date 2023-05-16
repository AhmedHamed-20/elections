import 'package:elections/core/constants/app_padding.dart';
import 'package:elections/core/constants/extensions.dart';
import 'package:elections/features/registrations/view/widgets/sign_in_button_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/sign_in_text_fields.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Sign In',
            style: context.theme.textTheme.titleMedium,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SignInTextFields(),
                SignInButtonWidget(),
              ],
            ),
          ),
        ));
  }
}
