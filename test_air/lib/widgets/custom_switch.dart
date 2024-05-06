import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../core/app_export.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class CustomSwitch extends StatelessWidget {
  CustomSwitch(
      {Key? key,
      required this.onChange,
      this.alignment,
      this.value,
      this.width,
      this.height,
      this.margin,
      this.color})
      : super(
          key: key,
        );

  final Alignment? alignment;

  bool? value;

  final Function(bool) onChange;

  final double? width;

  final double? height;

  final EdgeInsetsGeometry? margin;

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        margin: margin,
        child: alignment != null
            ? Align(
                alignment: alignment ?? Alignment.center, child: switchWidget)
            : switchWidget);
  }

  Widget get switchWidget => Switch(
        activeColor: color ?? Color.fromRGBO(34, 97, 188, 1),
        
        value: value ?? false,
        onChanged: (value) {
          onChange(value);
        },
      );
}
