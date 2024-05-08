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
        complexRouteTex: "Сложный маршрут"),
    ViewTipsItemModel(
        //routName: AppRoutes.anywhere,
        colorItem: Color.fromRGBO(34, 97, 188, 1),
        televisionImage: ImageConstant.imgGlobe,
        complexRouteTex: "Куда угодно"),
    ViewTipsItemModel(
        routName: AppRoutes.weekend,
        colorItem: Color.fromRGBO(0, 66, 125, 1),
        televisionImage: ImageConstant.imgCalendar,
        complexRouteTex: "Выходные"),
    ViewTipsItemModel(
        routName: AppRoutes.hotTickets,
        colorItem: Color.fromRGBO(255, 94, 94, 1),
        televisionImage: ImageConstant.imgFire,
        complexRouteTex: "Горячие билеты")
  ];

  List<BottomsheetItemModel> bottomsheetItemList = [
    BottomsheetItemModel(
        userImage: ImageConstant.imgRectangle288,
        username: "Стамбул",
        description: "Популярное направление"),
    BottomsheetItemModel(
        userImage: ImageConstant.imgRectangle28840x40,
        username: "Сочи",
        description: "Популярное направление"),
    BottomsheetItemModel(
        userImage: ImageConstant.imgRectangle2881,
        username: "Пхукет",
        description: "Популярное направление")
  ];
}