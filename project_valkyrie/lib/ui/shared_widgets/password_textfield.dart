import 'package:flutter/material.dart';
import 'package:project_valkyrie/ui/styles/app_colors.dart';

class PasswordTextField extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController controller;
  const PasswordTextField({Key key, this.formKey, this.controller})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => _PasswordTextField();
}

class _PasswordTextField extends State<PasswordTextField> {
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      this._obscureText = !this._obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 32,
      controller: widget.controller,
      keyboardType: TextInputType.visiblePassword,
      obscureText: this._obscureText,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        hintText: 'Please enter a password',
        hintStyle: TextStyle(
          fontSize: 16,
        ),
        prefixIcon: Icon(
          Icons.vpn_key,
          size: 32.0,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            Icons.remove_red_eye,
            size: 26,
            color: this._obscureText ? AppColors.primary : AppColors.primaryDark,
          ),
          onPressed: () => this._toggle(),
        ),
      ),
      style: TextStyle(
        fontSize: 18,
      ),
      // The validator receives the text that the user has entered.
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        if (value.length < 8 || value.length > 32) {
          return 'Password should between 8 - 32 characters';
        }
        return null;
      },
      onChanged: (value) {
        widget.formKey.currentState.validate();
      },
    );
  }
}