import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../core/app_export.dart';
import '../../../domain/all_tickets.dart';
import '../../../widgets/app_bar/appbar_leading_image.dart';
import '../../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../../widgets/app_bar/appbar_subtitle_two.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/custom_bottom_bar.dart';
import '../p1_main_page/air_main_page.dart';
import '../provider/air_main_provider.dart';
import 'models/userprofile2_item_model.dart';
import 'widgets/see_all_ticets_screen_item_widget.dart';

class SeeAllTicetsPage extends StatelessWidget {
  const SeeAllTicetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) {
          if (didPop) {
            return;
          }
          goBack();
        },
        child: Scaffold(
          appBar: _buildAppBar(context),
          body: Container(
            // height: 596.v,
            width: double.maxFinite,
            padding: EdgeInsets.only(top: 16.h),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                _buildTicketsViewList(context),
                Positioned(bottom: 0, child: _buildFloatingActionButton()),
              ],
            ),
          ),
          bottomNavigationBar: _buildBottomBar(context),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTicketsViewList(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.only(
            top: 1.v,
            // bottom: 18.v,
          ),
          child: Container(
            height: 590.v,
            child: Consumer<K1Provider>(
              builder: (context, provider, child) {
                return ListView.separated(
                  physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 14.v,
                    );
                  },
                  itemCount:
                      provider.tickets?.tickets?.length??0,
                  itemBuilder: (context, index) {
                    Tickets model = provider.tickets?.tickets?[index]??Tickets();
                    return SeeAllTicetsItemWidget(
                      model,
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Align _buildFloatingActionButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        // margin: EdgeInsets.only(
        //   left: 62.h,
        //   top: 527.v,
        //   right: 62.h,
        //),
        padding: EdgeInsets.symmetric(
          horizontal: 10.h,
          vertical: 4.v,
        ),
        decoration: AppDecoration.fillBlue.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgCut,
              height: 16.adaptSize,
              width: 16.adaptSize,
              margin: EdgeInsets.symmetric(vertical: 5.v),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 4.h,
                top: 10.v,
              ),
              child: Text(
                "lbl28".tr,
                style: theme.textTheme.titleSmall,
              ),
            ),
            CustomImageView(
              imagePath: ImageConstant.imgIconOnprimary,
              height: 16.adaptSize,
              width: 16.adaptSize,
              margin: EdgeInsets.only(
                left: 16.h,
                top: 5.v,
                bottom: 5.v,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 4.h,
                top: 5.v,
                bottom: 4.v,
              ),
              child: Text(
                "lbl29".tr,
                style: theme.textTheme.titleSmall,
              ),
            )
          ],
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    final provider = context.read<K1Provider>();
    final String direction =
        '${provider.departureCity}-${provider.arrivalCity}';
    final dateFormat = DateFormat('dd MMMM', 'ru');
    final String dateDeparture =
        dateFormat.format(provider.selectedDepartureDate);
    final String descriptionDeparture = '$dateDeparture, 1 пассажир';
    return CustomAppBar(
      leadingWidth: 40.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeftBlue800,
        margin: EdgeInsets.only(
          left: 16.h,
          top: 16.v,
          bottom: 16.v,
        ),
        onTap: () {
          goBack();
        },
      ),
      title: Padding(
        padding: EdgeInsets.only(left: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppbarSubtitleOne(
              text: direction,
              margin: EdgeInsets.only(right: 60.h),
            ),
            SizedBox(height: 4.v),
            AppbarSubtitleTwo(
              text: descriptionDeparture,
            )
          ],
        ),
      ),
      styleType: Style.bgFill,
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

  ///Handling route based on bottom click actions
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

  void goBack() {
    NavigatorService.popAndPushNamed(AppRoutes.selectCountry);
  }
}
