import 'package:flutter/material.dart';

import 'package:urvandeniss_s_1/domain/offer.dart';
import '../../../core/app_export.dart';

import '../provider/air_main_provider.dart';
import 'widgets/departure_field_widget.dart';
import 'widgets/offers/offers_item_widget.dart';

class AirMainPage extends StatelessWidget {
  const AirMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 32.v),
            child: Column(
              children: [
                _buildTextField(context),
                SizedBox(height: 34.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 16.h),
                    decoration: AppDecoration.outlineBlackF,
                    child: Text(
                      "msg3".tr,
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                ),
                SizedBox(height: 12.v),
                _buildOffersSection(context),
                SizedBox(height: 28.v),
                // CustomElevatedButton(
                //   text: "msg5".tr,
                //   margin: EdgeInsets.symmetric(horizontal: 16.h),
                // ),
                // SizedBox(height: 23.v),
                // Align(
                //   alignment: Alignment.centerLeft,
                //   child: Padding(
                //     padding: EdgeInsets.only(left: 16.h),
                //     child: Text(
                //       "lbl10".tr,
                //       style: theme.textTheme.titleLarge,
                //     ),
                //   ),
                // ),
                // SizedBox(height: 271.v),
                // CustomElevatedButton(
                //   text: "msg5".tr,
                //   margin: EdgeInsets.symmetric(horizontal: 16.h),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(BuildContext context) {
   final provider = context.read<AirScreensProvider>();
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.h),
      padding: EdgeInsets.all(16.h),
      decoration: AppDecoration.outlineBlack9003f.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 8.h,
          vertical: 15.v,
        ),
        decoration: AppDecoration.outlineBlack9003f1.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder16,
        ),
        child: Row(
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgRewind,
              height: 24.adaptSize,
              width: 24.adaptSize,
              margin: EdgeInsets.symmetric(vertical: 17.v),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 16.h,
                  top: 1.v,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        DepartureFieldWidget(),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                      color: appTheme.gray700,
                    ),
                    SizedBox(height: 8.v),
                    GestureDetector(
                      onTap: () => provider.showBottomSheetDialog(context),
                      child: Text(
                        "lbl7".tr,
                        style: CustomTextStyles.titleMediumPrimaryContainer,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildOffersSection(BuildContext context) {
    return SizedBox(
      height: 223.v,
      child: Consumer<AirScreensProvider>(
        builder: (context, provider, child) {
          return ListView.separated(
            padding: EdgeInsets.only(left: 16.h),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 67.h,
              );
            },
            itemCount: provider.offers?.offers?.length ?? 0,
            itemBuilder: (context, index) {
              Offers model = provider.offers!.offers![index];
              // provider.offers?.offers?[index];
              return OffersItemWidget(
                model,
              );
            },
          );
        },
      ),
    );
  }
}
