import 'package:blogify_flutter/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class AppTextfield extends StatelessWidget {
  const AppTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    this.obsecureText = false,
    this.suffix,
    this.prefixIcon,
    this.prefix,
    this.action = TextInputAction.next,
    this.keyboardType = TextInputType.name,
    this.capitalization = TextCapitalization.none,
    this.maxLine,
    this.autofocus = false,
    this.focusNode,
  });

  final TextEditingController controller;
  final String hintText;
  final bool obsecureText;
  final Widget? suffix;
  final IconData? prefixIcon;
  final Widget? prefix;
  final TextInputAction action;
  final TextInputType keyboardType;
  final TextCapitalization capitalization;
  final int? maxLine;
  final bool autofocus;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus,
      minLines: 1,
      focusNode: focusNode,
      maxLines: maxLine,
      controller: controller,
      textInputAction: action,
      obscuringCharacter: '*',
      obscureText: obsecureText,
      cursorColor: AppColor.mainApppurpleColor,
      keyboardType: keyboardType,
      textCapitalization: capitalization,
      decoration: InputDecoration(
        hintText: hintText,
        prefix: prefix,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: suffix,
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  const PasswordField(
      {super.key,
      required this.controller,
      this.action = TextInputAction.done});

  final TextEditingController controller;
  final TextInputAction action;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  late ValueNotifier<bool> isObsecure;
  @override
  void initState() {
    super.initState();
    isObsecure = ValueNotifier(true);
  }

  @override
  void dispose() {
    isObsecure.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isObsecure,
      builder: (context, showPassword, child) => AppTextfield(
        controller: widget.controller,
        hintText: 'Password',
        maxLine: 1,
        keyboardType: TextInputType.visiblePassword,
        obsecureText: showPassword,
        prefixIcon: Icons.key,
        suffix: IconButton(
          onPressed: () {
            isObsecure.value = !showPassword;
          },
          icon: Icon(
            showPassword ? Icons.visibility : Icons.visibility_off,
          ),
        ),
      ),
    );
  }
}
