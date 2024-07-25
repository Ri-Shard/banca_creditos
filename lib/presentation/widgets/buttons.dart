import 'package:banca_creditos/presentation/widgets/my_theme.dart';
import 'package:flutter/material.dart';

class Buttons extends StatefulWidget {
  final Widget? content;
  final Color? color;
  final Color? focuscolor;
  final Color? hovercolor;
  final Color? highlightColor;
  final Color? splashColor;
  final VoidCallback? ontap;
  final Color? borderColor;
  final double? borderradius;
  final double? width;
  final double? height;

  const Buttons(
      {super.key,
      this.content,
      this.color,
      this.ontap,
      this.borderColor,
      this.borderradius,
      this.focuscolor,
      this.hovercolor,
      this.highlightColor,
      this.splashColor,
      this.width,
      this.height});

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? 358,
      height: widget.height ?? 50,
      child: MaterialButton(
        elevation: 0.0,
        onPressed: widget.ontap,
        color: widget.color,
        splashColor: widget.splashColor,
        hoverColor: widget.hovercolor,
        focusColor: widget.focuscolor,
        highlightColor: widget.highlightColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderradius ?? 10),
            side: BorderSide(color: widget.borderColor ?? MyTheme.textGray)),
        child: widget.content,
      ),
    );
  }
}
