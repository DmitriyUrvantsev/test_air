import 'package:flutter/material.dart';
import '../../../../core/app_export.dart';
import '../models/userprofile_item_model.dart'; // ignore: must_be_immutable
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class UserprofileItemWidget extends StatelessWidget {
  UserprofileItemWidget(this.userprofileItemModelObj, {Key? key})
      : super(
          key: key,
        );

  UserprofileItemModel userprofileItemModelObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 132.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: userprofileItemModelObj.userImage!,
            height: 133.v,
            width: 132.h,
            radius: BorderRadius.circular(
              16.h,
            ),
          ),
          SizedBox(height: 8.v),
          Container(
            decoration: AppDecoration.outlineBlackF,
            child: Text(
              userprofileItemModelObj.userName!,
              style: theme.textTheme.titleMedium,
            ),
          ),
          SizedBox(height: 8.v),
          Text(
            userprofileItemModelObj.location!,
            style: theme.textTheme.bodyMedium,
          ),
          SizedBox(height: 3.v),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgAirplane,
                height: 24.adaptSize,
                width: 24.adaptSize,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 3.v),
                child: Text(
                  userprofileItemModelObj.flightPrice!,
                  style: theme.textTheme.bodyMedium,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
