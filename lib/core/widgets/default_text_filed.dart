import 'package:elections/core/constants/extensions.dart';
import 'package:flutter/material.dart';

import '../constants/app_padding.dart';
import '../constants/app_radius.dart';

class DefaultTextField extends StatelessWidget {
  const DefaultTextField(
      {super.key,
      required this.controller,
      this.keyboardType,
      this.labelText,
      this.labelStyle,
      this.suffixIcon,
      this.prefixIcon,
      this.onChanged,
      this.validator,
      this.onSubmit,
      this.padding = AppPadding.p10,
      this.maxLine = 1});
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? labelText;
  final double radius = AppRadius.r10;
  final TextStyle? labelStyle;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onSubmit;
  final bool obscureText = false;
  final double? padding;
  final int? maxLine;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        cursorColor: context.theme.primaryColor,
        maxLines: maxLine,
        style: Theme.of(context).textTheme.titleMedium,
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          contentPadding: const EdgeInsetsDirectional.all(AppPadding.p20),
          labelText: labelText,
          labelStyle: labelStyle,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
          errorMaxLines: 2,
        ),
        obscureText: obscureText,
        onChanged: onChanged,
        validator: validator,
        onFieldSubmitted: onSubmit,
      ),
    );
  }
}
