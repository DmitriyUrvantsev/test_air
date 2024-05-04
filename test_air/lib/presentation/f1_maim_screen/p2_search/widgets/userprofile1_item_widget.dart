import 'package:flutter/material.dart';
import '../../../../core/app_export.dart';
import '../models/userprofile1_item_model.dart'; // ignore: must_be_immutable
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class Userprofile1ItemWidget extends StatelessWidget {
  Userprofile1ItemWidget(this.userprofile1ItemModelObj, {Key? key})
      : super(
          key: key,
        );

  Userprofile1ItemModel userprofile1ItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 7.v,
        bottom: 6.v,
      ),
      decoration: AppDecoration.outlineGray800,
      child: Row(
        children: [
          CustomImageView(
            imagePath: userprofile1ItemModelObj.userImage!,
            height: 40.adaptSize,
            width: 40.adaptSize,
            radius: BorderRadius.circular(
              8.h,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userprofile1ItemModelObj.username!,
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(height: 3.v),
                Text(
                  userprofile1ItemModelObj.description!,
                  style: CustomTextStyles.bodyMediumGray700,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
