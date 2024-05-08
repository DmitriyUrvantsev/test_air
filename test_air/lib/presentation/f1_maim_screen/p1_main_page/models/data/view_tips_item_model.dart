import 'dart:ui';
import '../../../../../core/app_export.dart';

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
