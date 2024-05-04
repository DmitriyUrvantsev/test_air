import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/container_model.dart';

/// A provider class for the ContainerScreen.
///
/// This provider manages the state of the ContainerScreen, including the
/// current containerModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class ContainerProvider extends ChangeNotifier {
  ContainerModel containerModelObj = ContainerModel();

  @override
  void dispose() {
    super.dispose();
  }
}
