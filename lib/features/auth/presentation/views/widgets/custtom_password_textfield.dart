
import 'package:flutter/material.dart';
import 'custom_text_form_field.dart';

class CusttomPasswordTextField extends StatefulWidget {
  const CusttomPasswordTextField({
    super.key,
    required this.autovalidateMode,
    required this.passwordController,
    this.onSaved,
  });

  final AutovalidateMode autovalidateMode;
  final TextEditingController passwordController;
  final Function(String?)? onSaved;

  @override
  State<CusttomPasswordTextField> createState() =>
      _CusttomPasswordTextFieldState();
}

bool isVisible = true;

class _CusttomPasswordTextFieldState extends State<CusttomPasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
        obscureText: isVisible,
        autovalidateMode: widget.autovalidateMode,
        controller: widget.passwordController,
        onSaved: widget.onSaved,
        hintText: 'كلمة المرور',
        // inputType: TextInputType.visiblePassword,
        iconButton: isVisible
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                icon: Icon(Icons.visibility_off),
              )
            : IconButton(
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                icon: Icon(Icons.visibility),
              ));
  }
}
