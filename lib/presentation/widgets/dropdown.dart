import 'package:banca_creditos/presentation/widgets/my_theme.dart';
import 'package:flutter/material.dart';

class CustomDropdownButton extends StatefulWidget {
  final List<String> items;
  final String initialValue;
  final String hint;
  final Function(String) onChanged;
  final TextStyle textStyle;
  final TextStyle dropdownTextStyle;
  final TextStyle hintStyle;
  final Color backgroundColor;
  final Color dropdownBackgroundColor;
  final double elevation;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry dropdownPadding;
  final double borderRadius;

  CustomDropdownButton({
    required this.items,
    this.initialValue = '',
    required this.hint,
    required this.onChanged,
    this.textStyle = const TextStyle(fontSize: 14, color: MyTheme.textBlack),
    this.dropdownTextStyle =
        const TextStyle(fontSize: 14, color: MyTheme.anotherTextGray),
    this.hintStyle =
        const TextStyle(fontSize: 14, color: MyTheme.anotherTextGray),
    this.backgroundColor = MyTheme.backgroundwhite,
    this.dropdownBackgroundColor = MyTheme.backgroundwhite,
    this.elevation = 0,
    this.padding = const EdgeInsets.all(1),
    this.dropdownPadding = const EdgeInsets.all(1),
    this.borderRadius = 6,
  });

  @override
  _CustomDropdownButtonState createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  late String _selectedValue;

  @override
  void initState() {
    super.initState();

    _selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 327,
      padding: widget.padding,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        border: Border.all(color: MyTheme.anotherTextGray, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.transparent,
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, widget.elevation),
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: _selectedValue,
          onChanged: (value) {
            setState(() {
              _selectedValue = value!;
            });

            widget.onChanged(value!);
          },
          hint: Text(
            widget.hint,
            style: widget.hintStyle,
          ),
          items: widget.items.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: widget.dropdownTextStyle,
              ),
            );
          }).toList(),
          style: widget.textStyle,
          dropdownColor: widget.dropdownBackgroundColor,
          padding: widget.dropdownPadding,
        ),
      ),
    );
  }
}
