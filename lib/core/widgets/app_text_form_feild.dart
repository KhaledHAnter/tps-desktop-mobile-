import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theming/colors.dart';
import '../theming/styles.dart';

class AppTextFormFeild extends StatelessWidget {
  final String hintText;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final TextStyle? hintStyle;
  final TextStyle? inputTextStyle;
  final bool isObscureText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final Color? fillColor;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool? readOnly;
  final void Function()? onTap;
  final String? initialValue;
  final bool? digitsOnly;

  const AppTextFormFeild({
    super.key,
    required this.hintText,
    this.contentPadding,
    this.enabledBorder,
    this.focusedBorder,
    this.hintStyle,
    this.inputTextStyle,
    this.isObscureText = false,
    this.suffixIcon,
    this.keyboardType,
    this.fillColor,
    this.controller,
    this.validator,
    this.readOnly,
    this.onTap,
    this.initialValue,
    this.digitsOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        fillColor: fillColor ?? ColorsManager.containergray,
        filled: true,
        isDense: true,
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
                borderSide: const BorderSide(),
                borderRadius: BorderRadius.circular(8)),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(8)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.3,
            ),
            borderRadius: BorderRadius.circular(8)),
        hintStyle: hintStyle ?? Styles.font12regular,
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
      readOnly: readOnly ?? false,
      obscureText: isObscureText,
      onTap: onTap,
      textInputAction: TextInputAction.next,
      style: inputTextStyle,
      inputFormatters: digitsOnly!
          ? [
              FilteringTextInputFormatter.digitsOnly, // Allow digits only
            ]
          : null,
    );
  }
}
