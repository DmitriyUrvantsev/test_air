import 'package:flutter/material.dart';
import '../../../../core/app_export.dart';
import '../models/chips_item_model.dart';
import '../models/k4_model.dart';

/// A provider class for the K4Screen.
///
/// This provider manages the state of the K4Screen, including the
/// current k4ModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class K4Provider extends ChangeNotifier {
  TextEditingController citytwooneController = TextEditingController();

  K4Model k4ModelObj = K4Model();

  bool isSelectedSwitch = false;

  @override
  void dispose() {
    super.dispose();
    citytwooneController.dispose();
  }

  void onSelectedChipView(
    int index,
    bool value,
  ) {
    k4ModelObj.chipsItemList.forEach((element) {
      element.isSelected = false;
    });
    k4ModelObj.chipsItemList[index].isSelected = value;
    notifyListeners();
  }

  void changeSwitchBox(bool value) {
    isSelectedSwitch = value;
    notifyListeners();
  }
}
