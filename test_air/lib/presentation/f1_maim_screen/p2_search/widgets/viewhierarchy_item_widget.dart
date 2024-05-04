import 'package:flutter/material.dart';
import '../../../../core/app_export.dart';
import '../../../../widgets/custom_icon_button.dart';
import '../models/viewhierarchy_item_model.dart'; // ignore: must_be_immutable
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class ViewhierarchyItemWidget extends StatelessWidget {
  ViewhierarchyItemWidget(this.viewhierarchyItemModelObj, {Key? key})
      : super(
          key: key,
        );

  ViewhierarchyItemModel viewhierarchyItemModelObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 58.h,
      child: Column(
        children: [
          CustomIconButton(
            height: 48.adaptSize,
            width: 48.adaptSize,
            padding: EdgeInsets.all(12.h),
            child: CustomImageView(
              imagePath: viewhierarchyItemModelObj.televisionImage!,
            ),
          ),
          SizedBox(height: 7.v),
          SizedBox(
            width: 58.h,
            child: Text(
              viewhierarchyItemModelObj.complexRouteTex!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium!.copyWith(
                height: 1.20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
