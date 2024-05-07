import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../domain/offers_tickets.dart';
import '../../../theme/custom_button_style.dart';
import '../../../widgets/custom_bottom_bar.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_switch.dart';
import '../p1_main_page/air_main_page.dart';
import '../provider/air_main_provider.dart';
import '../p1_main_page/widgets/arrival_field_widget.dart';
import '../p1_main_page/widgets/departure_field_widget.dart';
import 'models/direct_flights_model.dart';
import 'models/settings_item_model.dart';

import 'widgets/direct_flights_widget.dart';
import 'widgets/settings_item_widget.dart';

class SelectCountryPage extends StatelessWidget {
  const SelectCountryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<K1Provider>();
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
                onPressed: () => onSeeAllTicets(),
                text: "msg8".tr,
                buttonStyle: CustomButtonStyles.fillBlue,
              ),
              SizedBox(height: 24.v),
              _buildTicketSubscription(context)
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  // -------Section Widget---------------------

  Widget _buildTextFields(BuildContext context) {
    final provider = context.read<K1Provider>();
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
          vertical: 10.v,
        ),
        decoration: AppDecoration.fillPrimary.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder16,
        ),
        child: Row(
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgArrowLeft,
              height: 24.adaptSize,
              width: 24.adaptSize,
              //margin: EdgeInsets.symmetric(vertical: 17.v),
              onTap: () {
                onTapImgArrowleftone(context);
              },
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 16.h,
                  top: 1.v,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        DepartureFieldWidget(),
                        Spacer(),
                        CustomImageView(
                          onTap: () => provider.swapCities(),
                          imagePath: ImageConstant.imgShare,
                          height: 24.adaptSize,
                          width: 24.adaptSize,
                          margin: EdgeInsets.only(right: 8.h),
                        ),
                      ],
                    ),
                    SizedBox(height: 3.v),
                    Divider(
                      thickness: 1,
                      color: appTheme.gray700,
                    ),
                    SizedBox(height: 5.v),
                    Row(
                      children: [
                        ArrivalFieldWidget(),
                        Spacer(),
                        CustomImageView(
                          onTap: () => {provider.arrivalController.clear()},
                          imagePath: ImageConstant.imgIconPrimarycontainer,
                          height: 24.adaptSize,
                          width: 24.adaptSize,
                          alignment: Alignment.bottomRight,
                          margin: EdgeInsets.only(right: 8.h),
                        ),
                      ],
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
    return Consumer<K1Provider>(
      builder: (context, provider, child) {
        return SizedBox(
          height: 33.v, // Замените эту высоту на необходимую
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: provider.k4ModelObj.settingsItemList.length,
            itemBuilder: (context, index) {
              SettingItemModel model =
                  provider.k4ModelObj.settingsItemList[index];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: SettingsItemWidget(
                  index: index, chipsItemModelObj: model,
                  //                 onDateSelected: (date) {
                  //   // Обработка выбранной даты здесь
                  //   print('Selected date: $date');
                  // },
                  // onSelectedChipView: (value) {
                  //   // provider.onSelectedChipView(index, value);
                  // },
                ),
              );
            },
          ),
        );
      },
    );
  }

  ///---------  _buildDirectFlights(---------------
  Widget _buildDirectFlights(BuildContext context) {
    final provider = context.read<K1Provider>();
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
          SizedBox(height: 8.v),
          Text(
            "lbl24".tr,
            style: CustomTextStyles.titleLarge20,
          ),
          SizedBox(height: 2.v),

//------------------
          Container(
            // margin: EdgeInsets.only(left: 10.h),
            padding: EdgeInsets.only(top: 10.h),

            child: ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 8.v,
                );
              },
              itemCount: provider.k4ModelObj.directFlightsList.length >= 3
                  ? 3
                  : provider.k4ModelObj.directFlightsList.length,
              itemBuilder: (context, index) {
                TicketsOffers model =
                    provider.offersTickets?.ticketsOffers?[index] ??
                        TicketsOffers();
                return DirectFlightsWidget(model, index);
              },
            ),
          ),

          SizedBox(height: 55.v),
          // CustomElevatedButton(
          //   text: "lbl26".tr,
          //   buttonStyle: CustomButtonStyles.fillOnPrimaryContainer,
          //   buttonTextStyle: CustomTextStyles.titleMediumBlue800,
          // )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTicketSubscription(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15.h,
        vertical: 6.v,
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
          Selector<K1Provider, bool?>(
            selector: (context, provider) => provider.isSelectedSwitch,
            builder: (context, isSelectedSwitch, child) {
              return CustomSwitch(
                margin: EdgeInsets.only(bottom: 1.v),
                value: isSelectedSwitch,
                onChange: (value) {
                  context.read<K1Provider>().changeSwitchBox(value);
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
        Navigator.pushNamed(context, getCurrentRoute(type));
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

  onSeeAllTicets() {
    NavigatorService.popAndPushNamed(AppRoutes.seeAllTicets);
  }
}
