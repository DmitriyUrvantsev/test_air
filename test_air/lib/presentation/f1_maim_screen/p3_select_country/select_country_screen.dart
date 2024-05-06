import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../theme/custom_button_style.dart';
import '../../../widgets/custom_bottom_bar.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_switch.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../p1_main_page/air_main_page.dart';
import 'models/direct_flights_model.dart';
import 'models/settings_item_model.dart';
import 'models/k4_model.dart';
import 'provider/k4_provider.dart';
import 'widgets/direct_flights_widget.dart';
import 'widgets/settings_item_widget.dart';

//! GlobalKey<NavigatorState> navigatorKey = GlobalKey();

class SelectCountryScreen extends StatelessWidget {
  const SelectCountryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 16.h,
            //vertical: 39.v,
          ),
          child: Column(
            children: [
              SizedBox(height: 8.v),
              _buildTextFields(context),
              SizedBox(height: 13.v),
              _buildSettingsSection(context),
              SizedBox(height: 12.v),
              _buildDirectFlights(context),
              SizedBox(height: 23.v),
              CustomElevatedButton(
                text: "msg8".tr,
                buttonStyle: CustomButtonStyles.fillBlue,
              ),
              SizedBox(height: 24.v),
              _buildOne(context)
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildTextFields(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      margin: EdgeInsets.all(0),
      color: theme.colorScheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Container(
        height: 96.v,
        width: 328.h,
        padding: EdgeInsets.symmetric(
          horizontal: 8.h,
          vertical: 16.v,
        ),
        decoration: AppDecoration.fillPrimary.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder16,
        ),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 32.h,
                  bottom: 1.v,
                ),
                child: Text(
                  '4444444444444!!!!!!!!!!',
                  // "lbl21".tr,
                  style: theme.textTheme.titleMedium,
                ),
              ),
            ),
            CustomImageView(
              imagePath: ImageConstant.imgIconPrimarycontainer,
              height: 24.adaptSize,
              width: 24.adaptSize,
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.only(right: 8.h),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 2.v),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgArrowLeft,
                      height: 24.adaptSize,
                      width: 24.adaptSize,
                      margin: EdgeInsets.only(top: 18.v),
                      onTap: () {
                        onTapImgArrowleftone(context);
                      },
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 8.h,
                          bottom: 9.v,
                        ),
                        child: Selector<SelectCountryProvider,
                            TextEditingController?>(
                          selector: (context, provider) =>
                              provider.citytwooneController,
                          builder: (context, citytwooneController, child) {
                            return CustomTextFormField(
                              controller: citytwooneController,
                              hintText: "lbl6".tr,
                              textInputAction: TextInputAction.done,
                              suffix: Container(
                                margin: EdgeInsets.only(
                                  left: 30.h,
                                  bottom: 9.v,
                                ),
                                child: CustomImageView(
                                  imagePath: ImageConstant.imgShare,
                                  height: 24.adaptSize,
                                  width: 24.adaptSize,
                                ),
                              ),
                              suffixConstraints: BoxConstraints(
                                maxHeight: 33.v,
                              ),
                              onSubmitted: (String) {},
                            );
                          },
                        ),
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

  /// Section Widget
  Widget _buildSettingsSection(BuildContext context) {
    return Consumer<SelectCountryProvider>(
      builder: (context, provider, child) {
        return SizedBox(
          height: 33.v, // Замените эту высоту на необходимую
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: provider.k4ModelObj.settingsItemList.length,
            itemBuilder: (context, index) {
              ChipsItemModel model =
                  provider.k4ModelObj.settingsItemList[index];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: SettingsItemWidget(
                  model,
                  onSelectedChipView: (value) {
                    provider.onSelectedChipView(index, value);
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }

//================================================================================
//================================================================================

  /// Section Widget
// Widget _buildDirectFlights(BuildContext context) {
//   final provider = context.read<SelectCountryProvider>();

//   return Container(
//     margin: EdgeInsets.only(left: 10.h),
//     padding: EdgeInsets.all(16.h),
//     decoration: AppDecoration.fillPrimary.copyWith(
//       borderRadius: BorderRadiusStyle.roundedBorder16,
//     ),
//     child: ListView.separated(
//       physics: NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       separatorBuilder: (context, index) {
//         return SizedBox(
//           height: 8.v,
//         );
//       },
//       itemCount: provider.k4ModelObj.directFlightsList.length,
//       itemBuilder: (context, index) {
//         DirectFlightsModel model =provider.k4ModelObj.directFlightsList[index];
//         return DirectFlightsWidget(
//           model,
//         );
//       },
//     ),
//   );
// }

  ///
  ///
  ///
  ///
  ///
  ///
  ///
  Widget _buildDirectFlights(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 6.v,
      ),
      decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 11.v),
          Text(
            "lbl24".tr,
            style: CustomTextStyles.titleLarge20,
          ),
          SizedBox(height: 6.v),

//------------------

          Container(
            padding: EdgeInsets.only(
              top: 7.v,
              bottom: 6.v,
            ),
            decoration: AppDecoration.fillBlue,
            // AppDecoration.outlineGray800,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  margin: EdgeInsets.only(bottom: 16.v),
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
                      bottom: 2.v,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                              Text(
                                "msg_08_05_09_55_16_35".tr,
                                style: theme.textTheme.bodyMedium,
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
          ),
          //-----------------------






          SizedBox(height: 8.v),
          Container(
            padding: EdgeInsets.only(
              top: 7.v,
              bottom: 6.v,
            ),
            decoration: AppDecoration.outlineGray800,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  margin: EdgeInsets.only(bottom: 16.v),
                  decoration: BoxDecoration(
                    color: appTheme.blue800,
                    borderRadius: BorderRadius.circular(
                      12.h,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 8.h,
                    bottom: 3.v,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "lbl25".tr,
                        style: theme.textTheme.titleSmall,
                      ),
                      SizedBox(height: 4.v),
                      Text(
                        "msg_08_05_09_55_16_35".tr,
                        style: theme.textTheme.bodyMedium,
                      )
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(bottom: 24.v),
                  child: Text(
                    "lbl_2_3902".tr,
                    style: CustomTextStyles.titleSmallBlue800,
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgArrowRight,
                  height: 16.v,
                  width: 14.h,
                  margin: EdgeInsets.only(bottom: 24.v),
                )
              ],
            ),
          ),
          SizedBox(height: 8.v),
          Container(
            padding: EdgeInsets.only(
              top: 7.v,
              bottom: 6.v,
            ),
            decoration: AppDecoration.outlineGray800,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  margin: EdgeInsets.only(bottom: 16.v),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(
                      12.h,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 8.h,
                    bottom: 3.v,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "lbl_nordstar".tr,
                        style: theme.textTheme.titleSmall,
                      ),
                      SizedBox(height: 4.v),
                      Text(
                        "lbl_13_10".tr,
                        style: theme.textTheme.bodyMedium,
                      )
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(bottom: 24.v),
                  child: Text(
                    "lbl_2_3902".tr,
                    style: CustomTextStyles.titleSmallBlue800,
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgArrowRight,
                  height: 16.v,
                  width: 14.h,
                  margin: EdgeInsets.only(bottom: 24.v),
                )
              ],
            ),
          ),
          SizedBox(height: 8.v),
          CustomElevatedButton(
            text: "lbl26".tr,
            buttonStyle: CustomButtonStyles.fillOnPrimaryContainer,
            buttonTextStyle: CustomTextStyles.titleMediumBlue800,
          )
        ],
      ),
    );
  }

//================================================================================
//================================================================================
//================================================================================
//================================================================================
//================================================================================
//================================================================================

  /// Section Widget
  Widget _buildOne(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15.h,
        vertical: 13.v,
      ),
      decoration: AppDecoration.fillGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgIcon,
            height: 24.adaptSize,
            width: 24.adaptSize,
            margin: EdgeInsets.only(bottom: 1.v),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 8.h,
              top: 3.v,
              bottom: 1.v,
            ),
            child: Text(
              "msg9".tr,
              style: theme.textTheme.bodyLarge,
            ),
          ),
          Spacer(),
          Selector<SelectCountryProvider, bool?>(
            selector: (context, provider) => provider.isSelectedSwitch,
            builder: (context, isSelectedSwitch, child) {
              return CustomSwitch(
                margin: EdgeInsets.only(bottom: 1.v),
                value: isSelectedSwitch,
                onChange: (value) {
                  context.read<SelectCountryProvider>().changeSwitchBox(value);
                },
              );
            },
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        // Navigator.pushNamed(
        //     navigatorKey.currentContext!, getCurrentRoute(type));
      },
    );
  }

  ///!Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.air:
        return AppRoutes.airMainPage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(
    BuildContext context,
    String currentRoute,
  ) {
    switch (currentRoute) {
      case AppRoutes.airMainPage:
        return AirMainPage.builder(context);
      default:
        return DefaultWidget();
    }
  }

  /// Navigates to the previous screen.
  onTapImgArrowleftone(BuildContext context) {
    NavigatorService.goBack();
  }
}
