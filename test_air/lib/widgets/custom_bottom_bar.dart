import 'package:flutter/material.dart';
import '../core/app_export.dart';

enum BottomBarEnum { air, hotel, short, subscr, profile }
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({this.onChanged});

  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.airplane,
      activeIcon: ImageConstant.airplane,
      title: "lbl11".tr,
      type: BottomBarEnum.air,
       //route: AppRoutes.k1Page,
    ),
    BottomMenuModel(
      icon: ImageConstant.hotels,
      activeIcon: ImageConstant.hotels,
      title: "lbl12".tr,
      type: BottomBarEnum.hotel,

    ),
    BottomMenuModel(
      
      icon: ImageConstant.locations,
      activeIcon: ImageConstant.locations,
      title: "lbl13".tr,
      type: BottomBarEnum.short,
    ),
    BottomMenuModel(
      icon: ImageConstant.subscriptions,
      activeIcon: ImageConstant.subscriptions,
      title: "lbl14".tr,
      type: BottomBarEnum.subscr,
    ),
    BottomMenuModel(
      icon: ImageConstant.profile,
      activeIcon: ImageConstant.profile,
      title: "lbl15".tr,
      type: BottomBarEnum.profile,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.v,
      decoration: BoxDecoration(
        color: theme.colorScheme.onErrorContainer,
        border: Border(
          top: BorderSide(
            color: theme.colorScheme.onPrimaryContainer,
            width: 1.h,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.black9003f,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              4,
            ),
          )
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: bottomMenuList[index].icon,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  color: theme.colorScheme.primaryContainer,
                ),
                Container(
                  margin: EdgeInsets.only(top: 3.v),
                  decoration: AppDecoration.outlineBlackF,
                  child: Text(
                    bottomMenuList[index].title ?? "",
                    style: theme.textTheme.bodySmall!.copyWith(
                      color: theme.colorScheme.primaryContainer,
                    ),
                  ),
                )
              ],
            ),
            activeIcon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: bottomMenuList[index].activeIcon,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  color: appTheme.blue800,
                ),
                Container(
                  margin: EdgeInsets.only(top: 3.v),
                  decoration: AppDecoration.outlineBlackF,
                  child: Text(
                    bottomMenuList[index].title ?? "",
                    style: CustomTextStyles.bodySmallBlue800.copyWith(
                      color: appTheme.blue800,
                    ),
                  ),
                )
              ],
            ),
            label: '',
          );
        }),
        onTap: (index) {
          selectedIndex = index;
          widget.onChanged?.call(bottomMenuList[index].type);
          setState(() {});
        },
      ),
    );
  }
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class BottomMenuModel {
  BottomMenuModel(
      {required this.icon,
      required this.activeIcon,
      this.title,
      required this.type});

  String icon;

  String activeIcon;

  String? title;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffffffff),
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
