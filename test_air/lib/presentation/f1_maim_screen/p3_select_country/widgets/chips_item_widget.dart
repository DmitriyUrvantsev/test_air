import 'package:flutter/material.dart';
import '../../../../core/app_export.dart';
import '../models/chips_item_model.dart'; // ignore: must_be_immutable
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class ChipsItemWidget extends StatelessWidget {
  ChipsItemWidget(this.chipsItemModelObj, {Key? key, this.onSelectedChipView})
      : super(
          key: key,
        );

  ChipsItemModel chipsItemModelObj;

  Function(bool)? onSelectedChipView;

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.only(
        top: 8.v,
        right: 10.h,
        bottom: 8.v,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        chipsItemModelObj.buttonsmall!,
        style: TextStyle(
          color: theme.colorScheme.onPrimary,
          fontSize: 14.fSize,
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w500,
        ),
      ),
      avatar: CustomImageView(
        imagePath: ImageConstant.imgPlus,
        height: 16.adaptSize,
        width: 16.adaptSize,
        margin: EdgeInsets.only(right: 8.h),
      ),
      selected: (chipsItemModelObj.isSelected ?? false),
      backgroundColor: theme.colorScheme.primary,
      selectedColor: theme.colorScheme.primary,
      shape: (chipsItemModelObj.isSelected ?? false)
          ? RoundedRectangleBorder(
              side: BorderSide(
                color: theme.colorScheme.onPrimary.withOpacity(0.6),
                width: 1.h,
              ),
              borderRadius: BorderRadius.circular(
                16.h,
              ))
          : RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.circular(
                16.h,
              ),
            ),
      onSelected: (value) {
        onSelectedChipView?.call(value);
      },
    );
  }
}
