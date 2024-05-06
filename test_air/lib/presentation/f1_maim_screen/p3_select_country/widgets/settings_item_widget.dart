// import 'package:flutter/material.dart';
// import '../../../../core/app_export.dart';
// import '../models/settings_item_model.dart'; // ignore: must_be_immutable
// // ignore_for_file: must_be_immutable

// // ignore_for_file: must_be_immutable
// class SettingsItemWidget extends StatelessWidget {
//   SettingsItemWidget(this.chipsItemModelObj,
//       {Key? key, this.onSelectedChipView})
//       : super(
//           key: key,
//         );

//   ChipsItemModel chipsItemModelObj;

//   Function(bool)? onSelectedChipView;

//   @override
//   Widget build(BuildContext context) {
//     return RawChip(

//       padding: EdgeInsets.only(
//           // top: 8.v,
//           // right: 10.h,
//           // bottom: 8.v,
//           ),
//       showCheckmark: false,
//       labelPadding: EdgeInsets.zero,
//       label: Text(
//         chipsItemModelObj.buttonsmall!,
//         style: TextStyle(
//           color: theme.colorScheme.onPrimary,
//           fontSize: 14.fSize,
//           fontFamily: 'SF Pro Display',
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//       avatar: CustomImageView(
//         imagePath: ImageConstant.imgPlus,
//         height: 16.adaptSize,
//         width: 16.adaptSize,
//         margin: EdgeInsets.only(right: 8.h),
//       ),
//       selected: (chipsItemModelObj.isSelected ?? false),
//       backgroundColor: theme.colorScheme.primary,
//       selectedColor: theme.colorScheme.primary,
//       shape: (chipsItemModelObj.isSelected ?? false)
//           ? RoundedRectangleBorder(
//               side: BorderSide(
//                 color: theme.colorScheme.onPrimary.withOpacity(0.6),
//                 width: 1.h,
//               ),
//               borderRadius: BorderRadius.circular(
//                 16.h,
//               ))
//           : RoundedRectangleBorder(
//               side: BorderSide.none,
//               borderRadius: BorderRadius.circular(
//                 16.h,
//               ),
//             ),
//       onSelected: (value) {
//         onSelectedChipView?.call(value);
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../../../../core/app_export.dart';
import '../models/settings_item_model.dart';

class SettingsItemWidget extends StatelessWidget {
  final ChipsItemModel chipsItemModelObj;
  final Function(bool)? onSelectedChipView;

  const SettingsItemWidget(
    this.chipsItemModelObj, {
    Key? key,
    this.onSelectedChipView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onSelectedChipView?.call(!(chipsItemModelObj.isSelected ?? false));
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.h),
          side: BorderSide(
            color: theme.colorScheme.onPrimary.withOpacity(0.6),
            width: 1.h,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.v),
      ).copyWith(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return theme.colorScheme.primary.withOpacity(0.6);
            }
            return chipsItemModelObj.isSelected ?? false
                ? theme.colorScheme.primary
                : Colors.transparent;
          },
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgPlus,
            height: 16.adaptSize,
            width: 16.adaptSize,
            margin: EdgeInsets.only(right: 8.h),
          ),
          Text(
            chipsItemModelObj.buttonsmall!,
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
