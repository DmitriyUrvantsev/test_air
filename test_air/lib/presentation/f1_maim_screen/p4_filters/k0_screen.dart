import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../theme/custom_button_style.dart';
import '../../../widgets/app_bar/appbar_leading_image.dart';
import '../../../widgets/app_bar/appbar_subtitle.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_switch.dart';
import 'models/k0_model.dart';
import 'provider/k0_provider.dart';

class K0Screen extends StatefulWidget {
  const K0Screen({Key? key})
      : super(
          key: key,
        );

  @override
  K0ScreenState createState() => K0ScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => K0Provider(),
      child: K0Screen(),
    );
  }
}

class K0ScreenState extends State<K0Screen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
              Text('00000000!!!!!!!'),
              //_buildStackBaggage(context),
              SizedBox(height: 15.v),
              //_buildRowTransfers(context),
              SizedBox(height: 5.v)
            ],
          ),
        ),
        bottomNavigationBar: _buildButtonDone(context),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 40.v,
      leadingWidth: 44.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgIconOnprimary24x24,
        margin: EdgeInsets.only(
          left: 20.h,
          top: 8.v,
          bottom: 8.v,
        ),
      ),
      title: AppbarSubtitle(
        text:
        '0000000000',
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
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 16.h),
              child: Text(
                "lbl3".tr,
                style: theme.textTheme.titleMedium,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(
                left: 16.h,
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
                  Selector<K0Provider, bool?>(
                    selector: (context, provider) => provider.isSelectedSwitch,
                    builder: (context, isSelectedSwitch, child) {
                      return CustomSwitch(
                        margin: EdgeInsets.only(bottom: 89.v),
                        value: isSelectedSwitch,
                        onChange: (value) {
                          context.read<K0Provider>().changeSwitchBox(value);
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 58.v),
              child: SizedBox(
                width: 52.h,
                child: Divider(),
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildRowTransfers(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.h),
      padding: EdgeInsets.all(15.h),
      decoration: AppDecoration.fillGray,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "msg".tr,
            style: theme.textTheme.bodyLarge,
          ),
          Selector<K0Provider, bool?>(
            selector: (context, provider) => provider.isSelectedSwitch1,
            builder: (context, isSelectedSwitch1, child) {
              return CustomSwitch(
                value: isSelectedSwitch1,
                onChange: (value) {
                  context.read<K0Provider>().changeSwitchBox1(value);
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
    return CustomElevatedButton(
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
