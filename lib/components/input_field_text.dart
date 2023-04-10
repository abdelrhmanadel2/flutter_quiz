import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CustomInputfield extends StatefulWidget {
  CustomInputfield(
      {Key? key,
      this.labelText,
      this.onEditingComplete,
      this.floatingLabelBehavior,
      this.suffixIcon,
      this.hintText,
      this.enable = true,
      this.onchange,
      this.filledColor,
      this.onTap,
      this.controller,
      this.keyboardType,
      this.validator,
      this.isAutoValidate = true,
      this.onFieldSubmitted,
      this.onSaved,
      this.filled = true,
      this.validated,
      this.obsecure = false,
      this.maxLines})
      : super(key: key);
  final labelText;
  final String? hintText;
  final suffixIcon;
  final bool enable;
  var validated;
  final onchange;
  final int? maxLines;
  final floatingLabelBehavior;
  final Color? filledColor;
  final TextEditingController? controller;
  final void Function(String?)? onSaved;
  final Function()? onTap;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onEditingComplete;
  final bool isAutoValidate;
  final TextInputType? keyboardType;
  final bool obsecure;
  final bool filled;

  @override
  State<CustomInputfield> createState() => _CustomInputfieldState();
}

class _CustomInputfieldState extends State<CustomInputfield> {
  var arabic = RegExp(r'^[\u0621-\u064A\u0660-\u0669 ]+');

  var textDirection;

  @override
  Widget build(BuildContext context) {
    context.theme;
    final theme = Theme.of(context);
    return
        // Material(
        //   elevation: 5.0,
        //   color: theme.scaffoldBackgroundColor,
        //   shadowColor: Colors.black38,
        //   // shape: OutlineInputBorder(borderSide: BorderSide(color: LightThemeColor.primaryLight)),
        //   child:

        TextFormField(
      maxLengthEnforcement: MaxLengthEnforcement.none,
      obscureText: widget.obsecure, onTap: widget.onTap,
      maxLines: widget.maxLines ?? 1,
      onEditingComplete: widget.onEditingComplete,
      decoration: InputDecoration(
        fillColor: widget.filledColor ?? theme.canvasColor,
        filled: widget.filled,
        labelText: widget.labelText,
        hintText: widget.hintText,
        contentPadding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
        labelStyle: theme.textTheme.bodyText1!.apply(color: theme.hintColor),
        floatingLabelStyle: theme.textTheme.bodyText1!.apply(color: theme.disabledColor),
        suffixIcon: (widget.suffixIcon != null)
            ? Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                widget.suffixIcon,
              ])
            : null,
        floatingLabelBehavior: widget.floatingLabelBehavior ?? FloatingLabelBehavior.never,
      ),
      keyboardType: widget.keyboardType,
      onChanged: (value) {
        print("arabic.hasMatch(controller?.text ?? " ")${arabic.hasMatch(widget.controller?.text ?? "")}");
        if (arabic.hasMatch(widget.controller?.text ?? "")) {
          setState(() {
            textDirection = TextDirection.rtl;
          });
        } else {
          setState(() {
            textDirection = TextDirection.ltr;
          });
        }
        widget.controller?.selection = TextSelection.fromPosition(TextPosition(offset: widget.controller?.text.length ?? 0));

        if (widget.onchange != null) widget.onchange(value);
      },
      textDirection: textDirection,
      controller: widget.controller,
      enabled: widget.enable,
      validator: widget.validator,
      autovalidateMode: widget.isAutoValidate ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
      onSaved: widget.onSaved,
      onFieldSubmitted: widget.onFieldSubmitted,
      // ),
    );
  }
}
