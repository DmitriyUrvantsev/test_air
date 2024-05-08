import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../provider/air_main_provider.dart';
import 'models/data/bottomsheet_item_model.dart';
import 'models/data/view_tips_item_model.dart';
import 'widgets/arrival_field_widget.dart';
import 'widgets/departure_field_widget.dart';
import 'widgets/bottomsheet_item_widget.dart';
import 'widgets/view_tips_item_widget.dart'; // ignore_for_file: must_be_immutable

class BottomSheetPage extends StatelessWidget {
  const BottomSheetPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<AirScreensProvider>();
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (didPop) {
          return;
        }
        Navigator.of(context).pop();
      },
      child: Column(
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
                    _buildDepartureArrivalSection(provider),
                    SizedBox(height: 24.v),
                    _buildTipsSection(),
                    SizedBox(height: 27.v),
                    _buildRecommendationsPlaces(),
                    SizedBox(height: 200.v)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///------------------------------------------------------------------
  Container _buildDepartureArrivalSection(AirScreensProvider provider) {
    return Container(
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
                      imagePath: ImageConstant.imgAirplanePrimarycontainer,
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
    );
  }

  ///------------------------------------------------------------------
  SizedBox _buildTipsSection() {
    return SizedBox(
      height: 92.v,
      child: Consumer<AirScreensProvider>(
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
            itemCount: provider.mainPageModelObj.viewTipsItemList.length,
            itemBuilder: (context, index) {
              ViewTipsItemModel model =
                  provider.mainPageModelObj.viewTipsItemList[index];
              return ViewTipsItemWidget(
                model,
              );
            },
          );
        },
      ),
    );
  }

  ///------------------------------------------------------------------
  Container _buildRecommendationsPlaces() {
    return Container(
      margin: EdgeInsets.only(left: 10.h),
      padding: EdgeInsets.all(16.h),
      decoration: AppDecoration.fillPrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Consumer<AirScreensProvider>(
        builder: (context, provider, child) {
          return ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 8.v,
              );
            },
            itemCount: provider.mainPageModelObj.bottomsheetItemList.length,
            itemBuilder: (context, index) {
              BottomsheetItemModel model =
                  provider.mainPageModelObj.bottomsheetItemList[index];
              return BottomsheetItemWidget(
                model,
              );
            },
          );
        },
      ),
    );
  }
}
