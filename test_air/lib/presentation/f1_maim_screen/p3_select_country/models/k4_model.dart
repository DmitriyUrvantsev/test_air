import 'package:flutter/material.dart';

import '../../../../core/app_export.dart';
import '../../p1_main_page/models/scr2_item_model.dart';
import '../../p1_main_page/provider/air_main_provider.dart';
import 'direct_flights_model.dart';
import 'settings_item_model.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class K4Model {
  // List<SettingItemModel> settingsItemList =
  //     List.generate(4, (index) => SettingItemModel());
  //final provider = context.read<K1Provider>();

  List<DirectFlightsModel> directFlightsList = [
    DirectFlightsModel(
        circleColor: Color.fromRGBO(255, 94, 94, 1),
        airCompany: 'Уральские авиалинии',
        time: "msg_08_05_09_55_16_35".tr,
        pice: '2390 \u20BD'),
    DirectFlightsModel(
        circleColor: Color.fromRGBO(34, 97, 188, 1),
        airCompany: 'Победа',
        time: "msg_08_05_09_55_16_35".tr,
        pice: '2390 \u20BD'),
    DirectFlightsModel(
        circleColor: Color.fromRGBO(255, 255, 255, 1),
        airCompany: 'NordStar',
        time: "msg_08_05_09_55_16_35".tr,
        pice: '2390 \u20BD'),
  ];

  List<SettingItemModel> settingsItemList = [
    SettingItemModel(iconButton: ImageConstant.imgPlus, iconText: 'обратно'),
    SettingItemModel(
        iconButton: null,
        iconText: '24 фв, сб',
        functtion: K1Provider().goBack),
    SettingItemModel(iconButton: ImageConstant.imgPlus, iconText: '1,эконом'),
    SettingItemModel(iconButton: ImageConstant.imgPlus, iconText: 'фильтры'),
  ];
}
