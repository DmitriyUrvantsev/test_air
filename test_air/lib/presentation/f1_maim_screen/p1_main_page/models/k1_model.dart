import 'package:flutter/material.dart';

import '../../../../core/app_export.dart';
import 'scr2_item_model.dart';
import 'scr1_item_model.dart';
import 'view_tips_item_model.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class K1Model {
  List<Scr1ItemModel> userprofileItemList = [
    Scr1ItemModel(
        userImage: ImageConstant.imgRectangle287,
        userName: "Die Antwoord",
        location: "Будапешт",
        flightPrice: "от 22 264 ₽ "),
    Scr1ItemModel(
        userImage: ImageConstant.imgRectangle287133x132,
        userName: "Socrat& Lera",
        location: "Санкт- Петербург",
        flightPrice: "от 2 390 ₽ ")
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

  List<Scr2ItemModel> scr2ItemList = [
    Scr2ItemModel(
        userImage: ImageConstant.imgRectangle288,
        username: "Стамбул",
        description: "Популярное направление"),
    Scr2ItemModel(
        userImage: ImageConstant.imgRectangle28840x40,
        username: "Сочи",
        description: "Популярное направление"),
    Scr2ItemModel(
        userImage: ImageConstant.imgRectangle2881,
        username: "Пхукет",
        description: "Популярное направление")
  ];
}
