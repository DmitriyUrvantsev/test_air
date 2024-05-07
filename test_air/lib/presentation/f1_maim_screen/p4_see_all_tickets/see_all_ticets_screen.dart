import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../widgets/app_bar/appbar_leading_image.dart';
import '../../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../../widgets/app_bar/appbar_subtitle_two.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/custom_bottom_bar.dart';
import '../p1_main_page/air_main_page.dart';
import 'models/k5_model.dart';
import 'models/userprofile2_item_model.dart';
import 'provider/k5_provider.dart';
import 'widgets/see_all_ticets_screen_item_widget.dart';

class K5Screen extends StatefulWidget {
  const K5Screen({Key? key})
      : super(
          key: key,
        );

  @override
  K5ScreenState createState() => K5ScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => K5Provider(),
      child: K5Screen(),
    );
  }
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class K5ScreenState extends State<K5Screen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

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
            color: Colors.grey,
            // height: 596.v,
            width: double.maxFinite,
            padding: EdgeInsets.all(16.h),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 62.h,
                      top: 527.v,
                      right: 62.h,
                    ),
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
                            '5555555555!!!!!!!!!!',
                            // "lbl28".tr,
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
                ),
                //_buildUserProfile(context)
              ],
            ),
          ),
          // bottomNavigationBar: _buildBottomBar(context),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
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
          children: [
            AppbarSubtitleOne(
              text: "lbl27".tr,
              margin: EdgeInsets.only(right: 60.h),
            ),
            SizedBox(height: 4.v),
            AppbarSubtitleTwo(
              text: "msg_23_1".tr,
            )
          ],
        ),
      ),
      styleType: Style.bgFill,
    );
  }

  /// Section Widget
  Widget _buildUserProfile(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(
          top: 10.v,
          bottom: 18.v,
        ),
        child: Consumer<K5Provider>(
          builder: (context, provider, child) {
            return ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 16.v,
                );
              },
              itemCount:
                  provider.seeAllTicetsModelObj.userprofile2ItemList.length,
              itemBuilder: (context, index) {
                SeeAllTicetsItemModel model =
                    provider.seeAllTicetsModelObj.userprofile2ItemList[index];
                return SeeAllTicetsItemWidget(
                  model,
                );
              },
            );
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Navigator.pushNamed(
            navigatorKey.currentContext!, getCurrentRoute(type));
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
  // onTapArrowleftone(BuildContext context) {
  //   NavigatorService.goBack();
  // }

  void goBack() {
    NavigatorService.popAndPushNamed(AppRoutes.selectCountry);
  }
}
