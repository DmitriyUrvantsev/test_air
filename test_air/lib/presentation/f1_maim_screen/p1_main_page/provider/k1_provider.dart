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
  TextEditingController tfController = TextEditingController();

  K1Model k1ModelObj = K1Model();

  @override
  void dispose() {
    super.dispose();
    tfController.dispose();
  }
}
