import 'package:flutter/material.dart';

class BaseFormTextField extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final String hintText;
  final TextEditingController controller;
  final String Function(String) validator;
  final Icon prefixIcon;
  final bool isValidatorEnable;
  final TextInputType keyboradInputType;
  final Widget suffix;
  BaseFormTextField(
      {Key key,
      this.formKey,
      this.controller,
      this.hintText,
      this.prefixIcon,
      this.keyboradInputType,
      this.validator,
      this.suffix,
      this.isValidatorEnable = false})
      : super(key: key);

  @override
  _BaseFormTextFieldState createState() => _BaseFormTextFieldState();
}

class _BaseFormTextFieldState extends State<BaseFormTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: widget.controller,
        textInputAction: TextInputAction.next,
        keyboardType: widget.keyboradInputType,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 2.0),
          alignLabelWithHint: true,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontSize: 16,
          ),
          prefixIcon: widget.prefixIcon,
          suffix: Padding(
            padding: const EdgeInsets.only(
                left: 8.0, right: 2.0, top: 2.0, bottom: 2.0),
            child: widget.suffix != null ? widget.suffix : Icon(null),
          ),
        ),
        style: TextStyle(fontSize: 18),
        // The validator receives the text that the user has entered.
        validator: widget.validator,
        onChanged: (value) => widget.isValidatorEnable
            ? widget.formKey.currentState.validate()
            : {},
      ),
    );
  }
}
