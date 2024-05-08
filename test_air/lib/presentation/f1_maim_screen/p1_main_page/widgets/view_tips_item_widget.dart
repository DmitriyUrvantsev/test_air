import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../core/app_export.dart';
import '../../../../widgets/custom_icon_button.dart';
import '../models/data/view_tips_item_model.dart';
import '../../provider/air_main_provider.dart'; //
// ignore_for_file: must_be_immutable

class ViewTipsItemWidget extends StatelessWidget {
  ViewTipsItemWidget(this.viewTipsItemModelObj, {Key? key})
      : super(
          key: key,
        );

  ViewTipsItemModel viewTipsItemModelObj;

  @override
  Widget build(BuildContext context) {
    final provider = context.read<AirScreensProvider>();
    return SizedBox(
      // width: 62.h,
      child: Column(
        children: [
          CustomIconButton(
            onTap: () {
              if (viewTipsItemModelObj.routName != null) {
                NavigatorService.popAndPushNamed(
                    viewTipsItemModelObj.routName ?? AppRoutes.airMainPage);
              } else {
                provider
                    .setArrivalCity(viewTipsItemModelObj.complexRouteTex ?? '');
                Navigator.of(context).pop();
                provider.showSelectCountry();
              }
            },
            color: viewTipsItemModelObj.colorItem,
            height: 48.adaptSize,
            width: 48.adaptSize,
            padding: EdgeInsets.all(12.h),
            child: CustomImageView(
              // color: Colors.amber,
              imagePath: viewTipsItemModelObj.televisionImage!,
            ),
          ),
          SizedBox(height: 7.v),
          Expanded(
            child: SizedBox(
              width: 76.h,
              child: Text(
                viewTipsItemModelObj.complexRouteTex!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium!
                    .copyWith(height: 1.20, fontSize: 14),
              ),
            ),
          )
        ],
      ),
    );
  }
}
