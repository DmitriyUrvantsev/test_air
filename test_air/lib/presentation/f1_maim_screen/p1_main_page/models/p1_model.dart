import 'package:flutter/material.dart';

import '../../../../core/app_export.dart';
import 'data/bottomsheet_item_model.dart';
import 'data/offer_image_model.dart';
import 'data/view_tips_item_model.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file:
class PageMainModel {
  List<OfferImageModel> offerImageItemList = [
    OfferImageModel(offerImage: ImageConstant.imgRectangle287, id: 1),
    OfferImageModel(offerImage: ImageConstant.imgRectangle287133x132, id: 2),
    OfferImageModel(offerImage: ImageConstant.imgRectangle2871, id: 3)
  ];

  ///-----------------scr2-----------------------------
  List<ViewTipsItemModel> viewTipsItemList = [
    ViewTipsItemModel(
        routName: AppRoutes.difficultRoute,
        colorItem: Color.fromRGBO(58, 99, 59, 1),
        televisionImage: ImageConstant.imgTelevision,
        complexRouteTex: "lbl16_Difficult_route".tr),
    ViewTipsItemModel(
        //routName: AppRoutes.anywhere,
        colorItem: Color.fromRGBO(34, 97, 188, 1),
        televisionImage: ImageConstant.imgGlobe,
        complexRouteTex: "lbl17_Anywhere".tr),
    ViewTipsItemModel(
        routName: AppRoutes.weekend,
        colorItem: Color.fromRGBO(0, 66, 125, 1),
        televisionImage: ImageConstant.imgCalendar,
        complexRouteTex:  "lbl18_Weekend".tr),
    ViewTipsItemModel(
        routName: AppRoutes.hotTickets,
        colorItem: Color.fromRGBO(255, 94, 94, 1),
        televisionImage: ImageConstant.imgFire,
        complexRouteTex:"lbl19_Hot tickets".tr)
  ];

  List<BottomsheetItemModel> bottomsheetItemList = [
    BottomsheetItemModel(
        userImage: ImageConstant.imgRectangle288,
        username: "lbl20_Istanbul".tr,
        description: "msg6_Popular_destination".tr),
    BottomsheetItemModel(
        userImage: ImageConstant.imgRectangle28840x40,
        username: "lbl21_Sochi".tr,
        description: "msg6_Popular_destination".tr),
    BottomsheetItemModel(
        userImage: ImageConstant.imgRectangle2881,
        username: "Пхукет",
        description: "msg6_Popular_destination".tr)
  ];
}
