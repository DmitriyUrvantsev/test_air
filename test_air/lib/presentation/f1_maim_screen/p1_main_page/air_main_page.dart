import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../widgets/app_bar/appbar_title.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_text_form_field.dart';
import 'models/k1_model.dart';
import 'models/userprofile_item_model.dart';
import 'provider/k1_provider.dart';
import 'widgets/userprofile_item_widget.dart'; // ignore_for_file: must_be_immutable

class AirMainPage extends StatefulWidget {
  const AirMainPage({Key? key})
      : super(
          key: key,
        );

  @override
  AirMainPageState createState() => AirMainPageState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => K1Provider(),
      child: AirMainPage(),
    );
  }
}

class AirMainPageState extends State<AirMainPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 32.v),
            child: Column(
              children: [
                _buildRewind(context),
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
                _buildUserProfile(context),
                SizedBox(height: 28.v),
                CustomElevatedButton(
                  text: "msg5".tr,
                  margin: EdgeInsets.symmetric(horizontal: 16.h),
                ),
                SizedBox(height: 33.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.h),
                    child: Text(
                      "lbl10".tr,
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                ),
                SizedBox(height: 271.v),
                CustomElevatedButton(
                  text: "msg5".tr,
                  margin: EdgeInsets.symmetric(horizontal: 16.h),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      centerTitle: true,
      title: AppbarTitle(
        text: '1111111111scr',
        //"msg2".tr,
      ),
    );
  }

  /// Section Widget
  Widget _buildRewind(BuildContext context) {
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
                    Selector<K1Provider, TextEditingController?>(
                      selector: (context, provider) => provider.tfController,
                      builder: (context, tfController, child) {
                        return CustomTextFormField(
                          controller: tfController,
                          hintText: "lbl6".tr,
                          textInputAction: TextInputAction.done,
                          contentPadding: EdgeInsets.symmetric(horizontal: 1.h),
                          borderDecoration:
                              TextFormFieldStyleHelper.underLineGray,
                        );
                      },
                    ),
                    SizedBox(height: 8.v),
                    Text(
                      "lbl7".tr,
                      style: CustomTextStyles.titleMediumPrimaryContainer,
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
  Widget _buildUserProfile(BuildContext context) {
    return SizedBox(
      height: 213.v,
      child: Consumer<K1Provider>(
        builder: (context, provider, child) {
          return ListView.separated(
            padding: EdgeInsets.only(left: 16.h),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 67.h,
              );
            },
            itemCount: provider.k1ModelObj.userprofileItemList.length,
            itemBuilder: (context, index) {
              UserprofileItemModel model =
                  provider.k1ModelObj.userprofileItemList[index];
              return UserprofileItemWidget(
                model,
              );
            },
          );
        },
      ),
    );
  }
}
