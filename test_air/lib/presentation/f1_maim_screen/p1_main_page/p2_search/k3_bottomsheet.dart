import 'package:flutter/material.dart';
import '../../../../core/app_export.dart';
import '../../../../widgets/custom_text_form_field.dart';
import 'models/k3_model.dart';
import 'models/userprofile1_item_model.dart';
import 'models/viewhierarchy_item_model.dart';
import 'provider/k3_provider.dart';
import 'widgets/userprofile1_item_widget.dart';
import 'widgets/viewhierarchy_item_widget.dart'; // ignore_for_file: must_be_immutable

class K3Bottomsheet extends StatefulWidget {
  const K3Bottomsheet({Key? key})
      : super(
          key: key,
        );

  @override
  K3BottomsheetState createState() => K3BottomsheetState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => K3Provider(),
      child: K3Bottomsheet(),
    );
  }
}

class K3BottomsheetState extends State<K3Bottomsheet> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Text('33333333333!!!!!!!!!'),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5.h),
            padding: EdgeInsets.all(16.h),
            decoration: AppDecoration.fillPrimary.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder16,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 33.v,
                  width: 296.h,
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Selector<K3Provider, TextEditingController?>(
                        selector: (context, provider) =>
                            provider.airplaneController,
                        builder: (context, airplaneController, child) {
                          return CustomTextFormField(
                            width: 296.h,
                            controller: airplaneController,
                            hintText: "lbl6".tr,
                            textInputAction: TextInputAction.done,
                            alignment: Alignment.center,
                            prefix: Container(
                              margin: EdgeInsets.only(
                                right: 8.h,
                                bottom: 9.v,
                              ),
                              child: CustomImageView(
                                imagePath:
                                    ImageConstant.imgAirplanePrimarycontainer,
                                height: 24.adaptSize,
                                width: 24.adaptSize,
                              ),
                            ),
                            prefixConstraints: BoxConstraints(
                              maxHeight: 33.v,
                            ), onSubmitted: (String ) {  },
                          );
                        },
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          height: 24.v,
                          width: 82.h,
                        ),
                      )
                    ],
                  ),
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
                    Padding(
                      padding: EdgeInsets.only(
                        left: 8.h,
                        bottom: 2.v,
                      ),
                      child: Text(
                        "lbl7".tr,
                        style: CustomTextStyles.titleMediumPrimaryContainer,
                      ),
                    ),
                    Spacer(),
                    CustomImageView(
                      imagePath: ImageConstant.imgIconPrimarycontainer,
                      height: 24.adaptSize,
                      width: 24.adaptSize,
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 24.v),
          Expanded(
            child: SizedBox(
              height: 92.v,
              child: Consumer<K3Provider>(
                builder: (context, provider, child) {
                  return ListView.separated(
                    padding: EdgeInsets.only(
                      left: 10.h,
                      right: 14.h,
                    ),
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 23.h,
                      );
                    },
                    itemCount: provider.k3ModelObj.viewhierarchyItemList.length,
                    itemBuilder: (context, index) {
                      ViewhierarchyItemModel model =
                          provider.k3ModelObj.viewhierarchyItemList[index];
                      return ViewhierarchyItemWidget(
                        model,
                      );
                    },
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 27.v),
          Container(
            margin: EdgeInsets.only(left: 10.h),
            padding: EdgeInsets.all(16.h),
            decoration: AppDecoration.fillPrimary.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder16,
            ),
            child: Consumer<K3Provider>(
              builder: (context, provider, child) {
                return ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 8.v,
                    );
                  },
                  itemCount: provider.k3ModelObj.userprofile1ItemList.length,
                  itemBuilder: (context, index) {
                    Userprofile1ItemModel model =
                        provider.k3ModelObj.userprofile1ItemList[index];
                    return Userprofile1ItemWidget(
                      model,
                    );
                  },
                );
              },
            ),
          ),
          SizedBox(height: 27.v)
        ],
      ),
    );
  }
}
