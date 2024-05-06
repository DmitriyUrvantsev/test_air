import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/app_export.dart';
import '../../p1_main_page/provider/air_main_provider.dart';
import 'direct_flights_model.dart';
import 'settings_item_model.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class SelectCountryModel {
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
 final dateFormat = DateFormat('dd MMM, E', 'ru');
   List<SettingItemModel> settingsItemList = [
    SettingItemModel(
    
 
        iconButton: ImageConstant.imgPlus,
        iconText: 'обратно',
        onSelectDate: (date) {}),

    SettingItemModel(
     
    
        iconButton: null, onSelectDate: (date) {}),

    SettingItemModel(iconButton: ImageConstant.imgPlus, iconText: '1,эконом'),
    SettingItemModel(iconButton: ImageConstant.imgPlus, iconText: 'фильтры'),
  ];
}
