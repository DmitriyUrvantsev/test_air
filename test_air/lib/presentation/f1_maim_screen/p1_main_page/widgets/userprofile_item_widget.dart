import 'package:flutter/material.dart';
import '../../../../core/app_export.dart';
import '../models/userprofile_item_model.dart';

class UserprofileItemWidget extends StatelessWidget {
  final UserprofileItemModel model;

  const UserprofileItemWidget(this.model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 132.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: model.userImage!,
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
              model.userName!,
              style: theme.textTheme.titleMedium,
            ),
          ),
          SizedBox(height: 8.v),
          Text(
            model.location!,
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
                  model.flightPrice!,
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
