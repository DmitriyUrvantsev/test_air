import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../theme/custom_button_style.dart';
import '../../../widgets/app_bar/appbar_leading_image.dart';
import '../../../widgets/app_bar/appbar_subtitle.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_switch.dart';
import '../provider/air_main_provider.dart';

class FiltersPage extends StatelessWidget {
  const FiltersPage({super.key});
  @override
  Widget build(BuildContext context) {
    final provider = context.read<AirScreensProvider>();
    return SafeArea(
      child: PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) {
          if (didPop) {
            return;
          }
          provider.showSelectCountry();
        },
        child: Scaffold(
          appBar: _buildAppBar(context),
          body: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(vertical: 24.v),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.h),
                    child: Text(
                      "lbl2".tr,
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                ),
                SizedBox(height: 14.v),
                _buildStackBaggage(context),
                SizedBox(height: 15.v),
                _buildRowTransfers(context),
                SizedBox(height: 5.v)
              ],
            ),
          ),
          bottomNavigationBar: _buildButtonDone(context),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    final provider = context.read<AirScreensProvider>();
    return CustomAppBar(
      height: 40.v,
      leadingWidth: 44.h,
      leading: AppbarLeadingImage(
        onTap: () => provider.showSelectCountry(),
        imagePath: ImageConstant.imgIconOnprimary24x24,
        margin: EdgeInsets.only(
          left: 20.h,
          top: 8.v,
          bottom: 8.v,
        ),
      ),
      title: AppbarSubtitle(
        text: 'Фильтры',
        // "lbl".tr,
        margin: EdgeInsets.only(left: 8.h),
      ),
      styleType: Style.bgFill,
    );
  }

  /// Section Widget
  Widget _buildStackBaggage(BuildContext context) {
    return SizedBox(
      height: 145.v,
      width: 344.h,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          // Align(
          //   alignment: Alignment.bottomLeft,
          //   child: Text(
          //     '1111', // "lbl3".tr,
          //     style: theme.textTheme.titleMedium,
          //   ),
          // ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(
                left: 7.h,
                right: 7.h,
                bottom: 4.v,
              ),
              padding: EdgeInsets.fromLTRB(15.h, 15.v, 15.h, 14.v),
              decoration: AppDecoration.outlineGray,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 1.v,
                      bottom: 89.v,
                    ),
                    child: Text(
                      "lbl4".tr,
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                  Selector<AirScreensProvider, bool?>(
                    selector: (context, provider) => provider.isSelectedSwitch,
                    builder: (context, isSelectedSwitch, child) {
                      return CustomSwitch(
                        margin: EdgeInsets.only(bottom: 89.v),
                        value: isSelectedSwitch,
                        onChange: (value) {
                          context
                              .read<AirScreensProvider>()
                              .changeSwitchBox(value);
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildRowTransfers(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.h),
      padding: EdgeInsets.fromLTRB(15.h, 5.v, 15.h, 5.v),
      decoration: AppDecoration.fillGray,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "msg".tr,
            style: theme.textTheme.bodyLarge,
          ),
          Selector<AirScreensProvider, bool?>(
            selector: (context, provider) => provider.isSelectedSwitch1,
            builder: (context, isSelectedSwitch1, child) {
              return CustomSwitch(
                value: isSelectedSwitch1,
                onChange: (value) {
                  context.read<AirScreensProvider>().changeSwitchBox1(value);
                },
              );
            },
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildButtonDone(BuildContext context) {
    final provider = context.read<AirScreensProvider>();
    return CustomElevatedButton(
      onPressed: () => provider.showSelectCountry(),
      height: 48.v,
      text: "lbl5".tr,
      margin: EdgeInsets.only(
        left: 16.h,
        right: 16.h,
        bottom: 62.v,
      ),
      buttonStyle: CustomButtonStyles.fillErrorContainer,
    );
  }
}
