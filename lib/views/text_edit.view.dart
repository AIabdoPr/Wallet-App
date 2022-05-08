import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../values.dart';

class TextEditView extends StatefulWidget {
  final TextEditingController? controller;
  final String hint;
  final TextInputType entryType;
  final EdgeInsets margin;
  final Color backgroundColor;
  final IconData? prefixIcon, suffixIcon;

  const TextEditView({
    Key? key,
    this.controller,
    this.entryType = TextInputType.text,
    this.hint = "",
    this.margin = const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    this.backgroundColor = const Color(0XFFDCDCDC),
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  @override
  State<TextEditView> createState() => _TextEditViewState();
}

class _TextEditViewState extends State<TextEditView> {
  bool hideText = false;

  @override
  void initState() {
    super.initState();
    hideText = widget.entryType == TextInputType.visiblePassword;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: widget.margin,
        child: TextField(
          obscureText: hideText,
          controller: widget.controller,
          keyboardType: widget.entryType,
          style: TextStyle(color: UIThemeColors.fieldText),
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: TextStyle(
              color: UIThemeColors.field,
              fontFamily: Consts.fontFamily,
            ),
            fillColor: UIThemeColors.fieldBg,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: UIThemeColors.field),
            ),
            prefixIcon:
                widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
            suffixIcon: widget.suffixIcon != null
                ? Icon(
                    widget.suffixIcon,
                    color: UIThemeColors.field,
                  )
                : (widget.entryType == TextInputType.visiblePassword
                    ? TextButton(
                        child: Icon(
                          hideText ? Icons.visibility : Icons.visibility_off,
                          color: hideText
                              ? UIThemeColors.field
                              : UIThemeColors.fieldFocus,
                          size: 25,
                        ),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.resolveWith(
                            (states) => RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                        onPressed: () => setState(() {
                          hideText = !hideText;
                        }),
                      )
                    : null),
            contentPadding: widget.prefixIcon == null
                ? const EdgeInsets.only(top: 15, left: 15)
                : const EdgeInsets.only(top: 0),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: UIThemeColors.fieldFocus, width: 1.6),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: UIThemeColors.field, width: 1.6),
              borderRadius: BorderRadius.circular(10),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: UIThemeColors.fieldBg, width: 1.6),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
