import 'package:flutter/material.dart';
import 'package:urvandeniss_s_1/core/utils/size_utils.dart';

import '../../../../core/app_export.dart';
import '../models/direct_flights_model.dart';

class DirectFlightsWidget extends StatelessWidget {
  final DirectFlightsModel directFlightsObj;

  const DirectFlightsWidget(this.directFlightsObj, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(
      //   top: 7.v,
      //   bottom: 6.v,
      // ),
      decoration: // AppDecoration.fillBlue,
          AppDecoration.outlineGray800,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 24.adaptSize,
            width: 24.adaptSize,
            margin: EdgeInsets.only(bottom: 14.v),
            decoration: BoxDecoration(
              color: appTheme.redA200,
              borderRadius: BorderRadius.circular(
                12.h,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 8.h,
                bottom: 10.v,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 1.v),
                              child: Text(
                                "msg7".tr,
                                style: theme.textTheme.titleSmall,
                              ),
                            ),
                            Text(
                              "lbl_2_3902".tr,
                              style: CustomTextStyles.titleSmallBlue800,
                            )
                          ],
                        ),
                        SizedBox(height: 2.v),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "msg_08_05_09_55_16_35".tr,
                              style: theme.textTheme.bodyMedium,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgArrowRight,
                    height: 16.v,
                    width: 14.h,
                    margin: EdgeInsets.only(bottom: 21.v),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );


  }
}
