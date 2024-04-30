import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xinner/utils/constants/my_constants.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  final IconData? prefixIcon;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final TextDirection? hintTextDirection;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final String hintText;
  final TextEditingController? controller;
  late bool isPassword;
  late bool isHidden;
  final int maxLines;
  final double space;
  final String? initValue;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool isEnabled;
  final TextInputAction? textInputAction;
  final Color? hintColor;
  final Color? prefixIconColor;
  CustomTextField({
    Key? key,
    this.prefixIcon,
    required this.hintText,
    this.suffixWidget,
    this.prefixIconColor,
    this.isHidden = false,
    this.maxLines = 1,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.onSaved,
    this.validator,
    this.hintColor,
    this.space = 0,
    this.initValue,
    this.isEnabled = true,
    this.prefixWidget,
    this.onChanged,
    this.textInputAction,
    this.hintTextDirection,
  }) : super(key: key) {
    isPassword = false;
  }

  CustomTextField.password({
    Key? key,
    this.prefixIcon,
    required this.hintText,
    this.suffixWidget,
    this.maxLines = 1,
    this.prefixIconColor,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.onSaved,
    this.validator,
    this.space = 0,
    this.initValue,
    this.hintColor,
    this.isEnabled = true,
    this.prefixWidget,
    this.onChanged,
    this.textInputAction,
    this.hintTextDirection,
  }) : super(key: key) {
    isPassword = true;
    isHidden = true;
  }

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

bool isFocused = false;

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          onTapOutside: (PointerDownEvent event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          controller: widget.controller,
          enabled: widget.isEnabled,
          initialValue: widget.initValue,
          textInputAction: widget.textInputAction,
          validator: widget.validator,
          onSaved: widget.onSaved,
          onChanged: widget.onChanged,
          maxLines: widget.maxLines,
          obscureText: widget.isHidden,
          keyboardType: widget.keyboardType,
          // cursorColor: kPrimaryColor,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            suffixIconConstraints:
                const BoxConstraints(minWidth: 0, minHeight: 0),
            // iconColor: kSecondaryColor,
            filled: true,
            prefixIcon: widget.prefixIcon == null
                ? widget.prefixWidget
                : Icon(
                    widget.prefixIcon,
                    color: widget.prefixIconColor,
                  ),
            suffixIcon: widget.isPassword
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.isHidden = !widget.isHidden;
                        });
                      },
                      child: Icon((widget.isHidden)
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined),
                    ),
                  )
                : widget.suffixWidget == null
                    ? null
                    : SizedBox(
                        width: 60,
                        child: FittedBox(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 10, top: 5, bottom: 5),
                            child: widget.suffixWidget,
                          ),
                        ),
                      ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(kRadius),
              borderSide: const BorderSide(color: kSecondaryColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(kRadius),
              borderSide: const BorderSide(color: kPrimaryColor),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(kRadius),
              borderSide: const BorderSide(color: kPrimaryColor),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(kRadius),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1,
              ),
            ),
            hintText: widget.hintText,
            hintTextDirection: widget.hintTextDirection,
            hintStyle: TextStyle(
              fontSize: 14,
              color: widget.hintColor,
            ),
          ),
        ),
        SizedBox(
          height: widget.space,
        ),
      ],
    );
  }
}
