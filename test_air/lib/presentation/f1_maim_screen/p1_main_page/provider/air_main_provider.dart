import 'package:flutter/material.dart';
import '../../../../core/app_export.dart';
import '../models/k1_model.dart';
import '../models/userprofile_item_model.dart';

/// A provider class for the K1Page.
///
/// This provider manages the state of the K1Page, including the
/// current k1ModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class K1Provider extends ChangeNotifier {
  final PrefUtils _prefUtils = PrefUtils();
  TextEditingController tfController = TextEditingController();

  K1Model k1ModelObj = K1Model();

  String? _departureCity;
  String? get departureCity => _departureCity;

  K1Provider() {
    setup();
  }

  void setup() {
    _departureCity = _prefUtils.getdepartureCity();
    print(_departureCity);
  }

  void savedepartureCity() {
    _departureCity = tfController.text.isNotEmpty
        ? '${tfController.text.trim().substring(0, 1).toUpperCase()}${tfController.text.trim().substring(1).toLowerCase()}'
        : "lbl6".tr;
    _prefUtils.setdepartureCity(_departureCity ?? "lbl6".tr);

    print(_departureCity);
  }

  @override
  void dispose() {
    super.dispose();
    tfController.dispose();
  }
}
