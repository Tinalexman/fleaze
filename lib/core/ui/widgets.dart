import 'package:fleaze/core/ui/colors.dart';
import 'package:fleaze/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FleazeTextField extends StatelessWidget {
  final Widget? prefix;
  final Widget? suffix;
  final String? hint;
  final Color? fillColor;
  final Color? borderColor;
  final EdgeInsets? padding;
  final bool obscure;
  final bool autoValidate;
  final FocusNode? focus;
  final bool autoFocus;
  final Function? onChange;
  final Function? onActionPressed;
  final Function? onValidate;
  final Function? onSave;
  final BorderRadius? radius;
  final TextEditingController controller;
  final TextInputType type;
  final TextInputAction action;
  final TextStyle? hintStyle;
  final bool readOnly;
  final bool expandArea;
  final double width;
  final double height;

  const FleazeTextField({
    super.key,
    required this.controller,
    required this.width,
    required this.height,
    this.fillColor,
    this.borderColor,
    this.padding,
    this.hintStyle,
    this.focus,
    this.autoFocus = false,
    this.readOnly = false,
    this.obscure = false,
    this.autoValidate = false,
    this.type = TextInputType.text,
    this.action = TextInputAction.none,
    this.onActionPressed,
    this.onChange,
    this.onValidate,
    this.onSave,
    this.radius,
    this.hint,
    this.prefix,
    this.suffix,
    this.expandArea = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: expandArea ? null : height,
      child: TextFormField(
        autovalidateMode:
            autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
        maxLines: expandArea ? null : 1,
        focusNode: focus,
        autofocus: autoFocus,
        controller: controller,
        obscureText: obscure,
        keyboardType: type,
        textInputAction: action,
        readOnly: readOnly,
        onEditingComplete: () {
          if (onActionPressed != null) {
            onActionPressed!(controller.text);
          }
        },
        cursorColor: var3,
        style:
            context.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          errorMaxLines: 1,
          errorStyle: const TextStyle(height: 0, fontSize: 0),
          fillColor: fillColor ?? var10,
          filled: true,
          contentPadding: padding ??
              EdgeInsets.symmetric(
                horizontal: 15.w,
                vertical: 5.h,
              ),
          prefixIcon: prefix != null
              ? SizedBox(
                  width: height,
                  height: height,
                  child: Center(
                    child: prefix,
                  ),
                )
              : null,
          suffixIcon: suffix != null
              ? SizedBox(
                  width: height,
                  height: height,
                  child: Center(child: suffix),
                )
              : null,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.r),
            borderSide: BorderSide.none,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.r),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.r),
            borderSide: BorderSide.none,
          ),
          hintText: hint,
          hintStyle: hintStyle ??
              context.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w500,
                color: context.isDark ? Colors.white54 : Colors.black54,
              ),
        ),
        onChanged: (value) {
          if (onChange == null) return;
          onChange!(value);
        },
        validator: (value) {
          if (onValidate == null) return null;
          return onValidate!(value);
        },
        onSaved: (value) {
          if (onSave == null) return;
          onSave!(value);
        },
      ),
    );
  }
}
