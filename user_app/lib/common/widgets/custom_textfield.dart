import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode node;
  final FocusNode? nextNode;

  CustomTextField({
    Key? key,
    required this.controller,
    this.hintText,
    this.tapOn,
    this.isNum = false,
    this.maxLength = 50,
    this.isPassword = false,
    this.autofillHints,
    required this.node,
    this.nextNode,
  }) : super(key: key);
  String? hintText;
  Function()? tapOn;
  final bool isNum;
  int maxLength;
  bool isPassword;
  final Iterable<String>? autofillHints;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // widget.controller.dispose();
  }

  bool ishide = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: widget.maxLength,
      keyboardType: widget.isNum ? TextInputType.number : TextInputType.text,
      controller: widget.controller,
      obscureText: widget.isPassword ? ishide : false,
      autofillHints: widget.autofillHints,
      focusNode: widget.node,
      textInputAction:
          widget.nextNode == null ? TextInputAction.done : TextInputAction.next,
      onSubmitted: (value) {
        if (widget.nextNode != null) {
          widget.node.unfocus();
          FocusScope.of(context).requestFocus(widget.nextNode);
        }
      },
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    ishide = !ishide;
                  });
                },
                icon: Icon(
                  ishide ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
              )
            : null,
        counterText: '',
        filled: true,
        fillColor: Colors.transparent,
        hintText: widget.hintText ?? "Enter number",
        hintStyle: const TextStyle(color: Colors.black),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
      ),
    );
  }
}
