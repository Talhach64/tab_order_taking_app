import 'package:flutter/material.dart';

import '../main.dart';



class MyPassField extends StatefulWidget {
  final String label, hint;
  final TextEditingController controller;
  final TextInputType keyboard;
  final FormFieldValidator<String?>? validator;


  const MyPassField(
      {Key? key,
        required this.label,
        required this.hint,
        required this.controller,
        this.validator,
        required this.keyboard})
      : super(key: key);

  @override
  State<MyPassField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyPassField> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
      child: TextFormField(
        cursorColor: primaryColor,
        obscureText: obscure,
        validator: widget.validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: widget.controller,
        keyboardType: widget.keyboard,
        //  validator: validator,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock),
          prefixIconColor: primaryColor,
          labelStyle: const TextStyle(color: primaryColor),
          hintText: widget.hint,
          labelText: widget.label,
          suffixIcon: GestureDetector(
            onTap: () => setState(() => obscure = !obscure),
            child: obscure
                ? const Icon(
              Icons.visibility,
              color: primaryColor,
            )
                : const Icon(Icons.visibility_off, color: primaryColor),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(color: primaryColor),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
          ),
          focusColor: primaryColor,
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: primaryColor),
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
    );
  }
}