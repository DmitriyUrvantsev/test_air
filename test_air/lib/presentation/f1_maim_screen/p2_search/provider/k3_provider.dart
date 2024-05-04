import 'package:flutter/material.dart';
import '../../../../core/app_export.dart';
import '../models/k3_model.dart';
import '../models/userprofile1_item_model.dart';
import '../models/viewhierarchy_item_model.dart';

/// A provider class for the K3Bottomsheet.
///
/// This provider manages the state of the K3Bottomsheet, including the
/// current k3ModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class K3Provider extends ChangeNotifier {
  TextEditingController airplaneController = TextEditingController();

  K3Model k3ModelObj = K3Model();

  @override
  void dispose() {
    super.dispose();
    airplaneController.dispose();
  }
}
