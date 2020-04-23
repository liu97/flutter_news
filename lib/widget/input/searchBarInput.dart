import 'package:flutter/material.dart';

class SearchBarInput extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintText;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final TextStyle style;
  final TextAlign textAlign;
  final bool autofocus;
  final ValueChanged<String> onSubmitted;

  SearchBarInput({
    Key key,
    this.controller,
    this.focusNode,
    this.hintText,
    this.textInputAction,
    this.keyboardType,
    this.style,
    this.textAlign = TextAlign.start,
    this.autofocus = false,
    this.onSubmitted,
  })  : assert(textAlign != null),
        assert(autofocus != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 30),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
          hintText: hintText,
          prefixIcon: Icon(
            Icons.search,
            color: Color(0xffb0b4b7),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none),
          fillColor: Color(0xfff5f5f5),
          filled: true,
        ),
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        style: style,
        textAlign: textAlign,
        autofocus: autofocus,
        onSubmitted: onSubmitted,
      ),
    );
  }
}
