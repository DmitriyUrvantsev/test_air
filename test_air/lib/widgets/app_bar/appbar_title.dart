import 'package:flutter/material.dart';
import '../../core/app_export.dart'; // ignore: must_be_immutable
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class AppbarTitle extends StatelessWidget {
  AppbarTitle({Key? key, required this.text, this.margin, this.onTap})
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
        child: Container(
          width: 84.h,
          decoration: AppDecoration.outlineBlackF,
          child: Text(
            text,
            maxLines: null,
            overflow: TextOverflow.ellipsis,
            style: CustomTextStyles.titleLargeBluegray100.copyWith(
              color: appTheme.blueGray100,
              height: 1.20,
            ),
          ),
        ),
      ),
    );
  }
}
