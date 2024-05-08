import 'package:flutter/material.dart';
import '../../../../core/app_export.dart';
import '../models/data/bottomsheet_item_model.dart';
import '../../provider/air_main_provider.dart';

class BottomsheetItemWidget extends StatelessWidget {
  final BottomsheetItemModel scr2ItemModelObj;

  const BottomsheetItemWidget(this.scr2ItemModelObj, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<AirScreensProvider>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 7.v,
              bottom: 6.v,
            ),
            decoration: AppDecoration.outlineGray800,
            child: Row(
              children: [
                CustomImageView(
                  imagePath: scr2ItemModelObj.userImage!,
                  height: 40.adaptSize,
                  width: 40.adaptSize,
                  radius: BorderRadius.circular(8.h),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        scr2ItemModelObj.username!,
                        style: CustomTextStyles.titleMedium,
                      ),
                      SizedBox(height: 3.v),
                      Text(
                        scr2ItemModelObj.description!,
                        style: CustomTextStyles.bodyMediumGray700,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                onTap: () {
                  provider.setArrivalCity(scr2ItemModelObj.username ?? '');
                  Navigator.of(context).pop();
                  provider.showSelectCountry();
                },
                child: SizedBox(
                  height: 50.v,
                  width: 150.h,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
