import 'package:flutter/material.dart';

import '../../../../core/app_export.dart';
import '../../p1_main_page/models/scr2_item_model.dart';
import 'direct_flights_model.dart';
import 'settings_item_model.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class K4Model {
  List<ChipsItemModel> settingsItemList =
      List.generate(4, (index) => ChipsItemModel());

  List<DirectFlightsModel> directFlightsList= [
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
}
