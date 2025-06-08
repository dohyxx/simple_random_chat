import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/default/default_widget.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/logger/logger.dart';

class DefaultTextField extends StatelessWidget {
  final TextEditingController? controller;
  final ScrollController? scrollController;
  final FocusNode? focusNode;
  final String? hintText;
  final bool autofocus;
  final bool error;
  final ValueChanged? onChanged;
  final Function? onTap;
  final ValueChanged<String>? onFieldSubmitted;
  final bool obscureText;
  final FormFieldValidator? validator;
  final TextInputType? textInputType;
  final int maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final Color textColor;
  final Color focusedBorderColor;
  final Color outlineInputBorderColor;
  final Color borderColor;
  final bool readOnly;
  final Widget? suffixIcon;
  final double fontSize;
  final double hintTextSize;
  final TextInputAction? textInputAction;

  const DefaultTextField({
    this.controller,
    this.scrollController,
    this.hintText,
    this.suffixIcon,
    this.fontSize = 15,
    this.hintTextSize = 15,
    this.focusNode,
    this.onChanged,
    this.onTap,
    this.onFieldSubmitted,
    this.validator,
    this.maxLength = 500,
    this.inputFormatters,
    this.readOnly = false,
    this.autofocus = false,
    this.obscureText = false,
    this.error = false,
    this.textInputAction = TextInputAction.done,
    this.textInputType = TextInputType.emailAddress,
    this.focusedBorderColor = const Color(0xffFFFFFF),
    this.outlineInputBorderColor = Colors.transparent,
    this.borderColor = const Color(0xFFD9D9D9),
    this.textColor = const Color(0xff222222),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final focus = focusNode ?? FocusNode();
    final textController = controller ?? TextEditingController();

    return TextFormField(
      scrollController: scrollController,
      controller: controller ?? textController,
      focusNode: focus,
      textAlign: TextAlign.start,
      cursorHeight: 16,
      cursorColor: const Color(0xff707070),
      autofocus: autofocus,
      obscureText: obscureText,
      obscuringCharacter: '●',
      onChanged: onChanged,
      maxLength: maxLength,
      onTap: () {
        if (onTap != null) {
          onTap!();
        }

        focus.requestFocus();
      },
      onFieldSubmitted: onFieldSubmitted,
      style: defaultTextStyle(
        fontSize: fontSize,
        color: textColor,
      ),
      validator: validator,
      decoration: InputDecoration(
        counterText: '',
        hintText: hintText,
        hintStyle: defaultTextStyle(
          fontSize: hintTextSize,
          color: Color(0xFF6D6A68).withValues(alpha: 0.4),
          fontWeight: FontWeight.w800,
        ),
        contentPadding: EdgeInsets.zero,
        errorStyle: defaultTextStyle(
          color: Color(0xffFD3F3F),
          fontSize: 14,
        ),
        suffixIcon: suffixIcon,
        focusedBorder: defaultOutlineInputBorder(outlineInputBorderColor),
        border: defaultOutlineInputBorder(outlineInputBorderColor),
        enabledBorder: defaultOutlineInputBorder(outlineInputBorderColor),
      ),
      keyboardType: textInputType,
      textInputAction: textInputAction,
      inputFormatters: inputFormatters,
      readOnly: readOnly,
      minLines: 1,
      maxLines: 15,
      scrollPadding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom + fontSize * 5),
    );
  }
}

OutlineInputBorder defaultOutlineInputBorder(Color color) {
  return OutlineInputBorder(borderSide: BorderSide(color: color));
}
