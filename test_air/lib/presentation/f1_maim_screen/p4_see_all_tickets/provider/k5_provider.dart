import 'package:flutter/material.dart';
import '../../../../core/app_export.dart';
import '../models/k5_model.dart';
import '../models/userprofile2_item_model.dart';

/// A provider class for the K5Screen.
///
/// This provider manages the state of the K5Screen, including the
/// current k5ModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class K5Provider extends ChangeNotifier {
  seeAllTicetsModel seeAllTicetsModelObj = seeAllTicetsModel();

  @override
  void dispose() {
    super.dispose();
  }
}
