import 'package:flutter/material.dart';
import '../../../../core/app_export.dart';
import '../models/settings_item_model.dart';

class SettingsItemWidget extends StatelessWidget {
  final SettingItemModel chipsItemModelObj;
  //final Function(bool)? onSelectedChipView;

  const SettingsItemWidget(
    this.chipsItemModelObj, {
    Key? key,
    // this.onSelectedChipView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if(chipsItemModelObj.functtion != null) {
    chipsItemModelObj.functtion!();
  }
        // onSelectedChipView?.call(!(chipsItemModelObj.isSelected ?? false));
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.h),
          // side: BorderSide(
          //   color: theme.colorScheme.onPrimary.withOpacity(0.6),
          //   width: 1.h,
          // ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 8.v),
      ).copyWith(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            // if (states.contains(MaterialState.pressed)) {
            if (true) {
              return theme.colorScheme.primary.withOpacity(0.6);
            }
            // return chipsItemModelObj.isSelected ?? false
            //     ? theme.colorScheme.primary
            //     : Colors.transparent;
          },
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImageView(
            imagePath: chipsItemModelObj.iconButton ?? null,
            height: 16.adaptSize,
            width: 16.adaptSize,
            margin: EdgeInsets.only(right: 8.h),
          ),
          Text(
            chipsItemModelObj.iconText ?? '',
            style: TextStyle(
              color: theme.colorScheme.onPrimary,
              fontSize: 14.fSize,
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}
