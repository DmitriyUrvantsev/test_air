import 'dart:ui';

import '../../../../core/app_export.dart';

/// This class is used in the [viewhierarchy_item_widget] screen.
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class ViewTipsItemModel {
  ViewTipsItemModel(
      {this.televisionImage,
      this.complexRouteTex,
      this.id,
      this.colorItem,
      this.routName}) {
    televisionImage = televisionImage ?? ImageConstant.imgTelevision;
    complexRouteTex = complexRouteTex ?? "Сложный маршрут";
    id = id ?? "";
  }

  Color? colorItem;
  String? routName;
  String? televisionImage;
  String? complexRouteTex;
  String? id;
}
