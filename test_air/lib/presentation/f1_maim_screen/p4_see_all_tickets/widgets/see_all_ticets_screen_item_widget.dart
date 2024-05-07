import 'package:flutter/material.dart';
import '../../../../core/app_export.dart';
import '../models/userprofile2_item_model.dart'; // ignore: must_be_immutable
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class SeeAllTicetsItemWidget extends StatelessWidget {
  SeeAllTicetsItemWidget(this.seeAllTicetsItemModelObj, {Key? key})
      : super(
          key: key,
        );

  SeeAllTicetsItemModel seeAllTicetsItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: 125.v,
        width: 328.h,
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.only(left: 16.h, bottom: 16.v, top: 8.v),
                decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder8,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 4.v),
                    Text(
                      seeAllTicetsItemModelObj.price!,
                      style: theme.textTheme.titleLarge,
                    ),
                    SizedBox(height: 14.v),
                    Row(
                      children: [
                        Container(
                          height: 24.adaptSize,
                          width: 24.adaptSize,
                          margin: EdgeInsets.only(
                            top: 7.v,
                            bottom: 6.v,
                          ),
                          decoration: BoxDecoration(
                            color: appTheme.redA200,
                            borderRadius: BorderRadius.circular(
                              12.h,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                seeAllTicetsItemModelObj.time!,
                                style: theme.textTheme.titleSmall,
                              ),
                              SizedBox(height: 4.v),
                              Text(
                                seeAllTicetsItemModelObj.destination!,
                                style:
                                    CustomTextStyles.titleSmallPrimaryContainer,
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 1.v,
                          width: 10.h,
                          margin: EdgeInsets.only(
                            left: 2.h,
                            top: 9.v,
                            bottom: 27.v,
                          ),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primaryContainer,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 3.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                seeAllTicetsItemModelObj.time1!,
                                style: theme.textTheme.titleSmall,
                              ),
                              SizedBox(height: 4.v),
                              Text(
                                seeAllTicetsItemModelObj.destination1!,
                                style:
                                    CustomTextStyles.titleSmallPrimaryContainer,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 13.h,
                            bottom: 19.v,
                          ),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "lbl_42".tr,
                                  style: theme.textTheme.bodyMedium,
                                ),
                                TextSpan(
                                  text: "lbl30".tr,
                                  style: CustomTextStyles
                                      .bodyMediumPrimaryContainer,
                                ),
                                TextSpan(
                                  text: "lbl31".tr,
                                  style: theme.textTheme.bodyMedium,
                                )
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 126.h,
                padding: EdgeInsets.symmetric(
                  horizontal: 10.h,
                  vertical: 1.v,
                ),
                decoration: AppDecoration.fillBlue.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder8,
                ),
                child: Text(
                  seeAllTicetsItemModelObj.buttonsmall!,
                  style: theme.textTheme.titleSmall,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
