import 'package:flutter/material.dart';
import '../../core/app_export.dart'; // ignore: 
// ignore_for_file: must_be_immutable

// ignore_for_file: 
class AppbarSubtitleTwo extends StatelessWidget {
  AppbarSubtitleTwo({Key? key, required this.text, this.margin, this.onTap})
      : super(
          key: key,
        );

  String text;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Text(
          text,
          style: CustomTextStyles.titleSmallPrimaryContainer.copyWith(
            color: theme.colorScheme.primaryContainer,
          ),
        ),
      ),
    );
  }
}
