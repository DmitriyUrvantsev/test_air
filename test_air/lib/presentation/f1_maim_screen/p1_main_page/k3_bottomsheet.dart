import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import '../../../core/app_export.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../provider/air_main_provider.dart';
import 'models/scr2_item_model.dart';
import 'models/view_tips_item_model.dart';
import 'widgets/arrival_field_widget.dart';
import 'widgets/departure_field_widget.dart';
import 'widgets/scr2_item_widget.dart';
import 'widgets/view_tips_item_widget.dart'; // ignore_for_file: must_be_immutable

class K3BottomSheet extends StatelessWidget {
  const K3BottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<K1Provider>();
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              color: Color.fromRGBO(41, 42, 47, 1),
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(
                horizontal: 11.h,
                vertical: 16.v,
              ),
              child: Column(
                children: [
                  Container(
                    height: 5.v,
                    width: 38.h,
                    decoration: BoxDecoration(
                      color: appTheme.gray700,
                      borderRadius: BorderRadius.circular(
                        2.h,
                      ),
                    ),
                  ),
                  SizedBox(height: 24.v),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.h),
                    padding: EdgeInsets.all(16.h),
                    decoration: AppDecoration.fillPrimary.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder16,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 33.v,
                          width: 296.h,
                          child: Stack(
                            alignment: Alignment.topLeft,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center, //!

                                children: [
                                  CustomImageView(
                                    imagePath: ImageConstant
                                        .imgAirplanePrimarycontainer,
                                    height: 24.adaptSize,
                                    width: 24.adaptSize,
                                  ),
                                  SizedBox(width: 8.h),
                                  DepartureFieldWidget(),
                                ],
                              ),
                              // Align(
                              //   alignment: Alignment.topLeft,
                              //   child: Container(
                              //     color: Colors.amber,
                              //     height: 24.v,
                              //     width: 82.h,
                              //   ),
                              // )
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: appTheme.gray700,
                        ),
                        SizedBox(height: 7.v),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgRewindOnprimary,
                              height: 24.adaptSize,
                              width: 24.adaptSize,
                            ),
                            SizedBox(width: 8.h),
                            ArrivalFieldWidget(),
                            Spacer(),
                            CustomImageView(
                              onTap: () {
                                provider.arrivalController.clear();
                              },
                              imagePath: ImageConstant.imgIconPrimarycontainer,
                              height: 24.adaptSize,
                              width: 24.adaptSize,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  //------------------------------------------------------------------
                  SizedBox(height: 24.v),

                  //------------------------------------------------------------------
                  SizedBox(
                    height: 92.v,
                    child: Consumer<K1Provider>(
                      builder: (context, provider, child) {
                        return ListView.separated(
                          padding: EdgeInsets.only(
                            left: 10.h,
                            right: 14.h,
                          ),
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: 5.h,
                            );
                          },
                          itemCount:
                              provider.k1ModelObj.viewTipsItemList.length,
                          itemBuilder: (context, index) {
                            ViewTipsItemModel model =
                                provider.k1ModelObj.viewTipsItemList[index];
                            return ViewTipsItemWidget(
                              model,
                            );
                          },
                        );
                      },
                    ),
                  ),
                  //------------------------------------------------------------------
                  SizedBox(height: 27.v),
                  //------------------------------------------------------------------
                  Container(
                    margin: EdgeInsets.only(left: 10.h),
                    padding: EdgeInsets.all(16.h),
                    decoration: AppDecoration.fillPrimary.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder16,
                    ),
                    child: Consumer<K1Provider>(
                      builder: (context, provider, child) {
                        return ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 8.v,
                            );
                          },
                          itemCount: provider.k1ModelObj.scr2ItemList.length,
                          itemBuilder: (context, index) {
                            Scr2ItemModel model =
                                provider.k1ModelObj.scr2ItemList[index];
                            return Scr2ItemWidget(
                              model,
                            );
                          },
                        );
                      },
                    ),
                  ),
                  //------------------------------------------------------------------

                  SizedBox(height: 200.v)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
