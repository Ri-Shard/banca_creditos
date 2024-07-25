import 'package:banca_creditos/presentation/widgets/my_theme.dart';
import 'package:flutter/material.dart';

class Custominput extends StatefulWidget {
  final String? labeltext;
  final Widget? suffix;
  final Icon? prefix;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final bool? obscureText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool? enable;
  final int? maxlines;
  final double? border;
  final double? height;
  final String? hint;

  const Custominput(
      {super.key,
      this.labeltext,
      this.suffix,
      this.prefix,
      this.controller,
      this.inputType,
      this.obscureText,
      this.onChanged,
      this.validator,
      this.maxlines,
      this.border,
      this.enable,
      this.hint,
      this.height});

  @override
  State<Custominput> createState() => CustominputState();
}

class CustominputState extends State<Custominput> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 327,
      height: widget.height ?? 71,
      child: TextFormField(
        enabled: widget.enable,
        maxLines: widget.maxlines ?? 1,
        validator: widget.validator,
        obscureText: widget.obscureText ?? false,
        keyboardType: widget.inputType,
        controller: widget.controller,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
            hintStyle: TextStyle(fontSize: 14, color: MyTheme.textGray),
            hintText: widget.hint,
            labelText: widget.labeltext,
            suffixIcon: widget.suffix ?? null,
            prefixIcon: widget.prefix,
            border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(widget.border ?? 6)))),
      ),
    );
  }
}
