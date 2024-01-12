// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class InputFormStepValidation extends StatelessWidget {
  const InputFormStepValidation(
      {Key? key,
      required this.inputController,
      this.filled = true,
      this.readOnly = false,
      required this.errorText,
      required this.contentPadding,
      required this.isRequired,
      this.onChanged})
      : super(key: key);

  final TextEditingController inputController;
  final bool? filled;
  final bool? readOnly;
  final String errorText;
  final EdgeInsetsGeometry? contentPadding;
  final bool isRequired;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 5,
          child: TextFormField(
              controller: inputController,
              style: const TextStyle(color: Colors.transparent),
              autocorrect: false,
              enabled: false,
              readOnly: readOnly!,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                contentPadding: contentPadding,
                filled: false, 
                fillColor: Colors.transparent,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                border: InputBorder.none,
                errorBorder: InputBorder.none,
              ),
              validator: (value) => (value!.isEmpty) ? errorText : null,

              // (value) => (isRequired || validatorMode == "url")
              //     ? Validators.getValidator(
              //         validatorMode, value!.trim(), minLength, equalTo, context)
              //     : null,
              onSaved: (value) {}

              // (value) {
              //   Validators.formInputValues["$fieldName"] = value!.trim();
              // },
              ),
        ),
      ],
    );
  }
}
