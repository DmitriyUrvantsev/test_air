import '../../../../core/app_export.dart';

/// This class is used in the [viewhierarchy_item_widget] screen.
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class ViewhierarchyItemModel {
  ViewhierarchyItemModel(
      {this.televisionImage, this.complexRouteTex, this.id}) {
    televisionImage = televisionImage ?? ImageConstant.imgTelevision;
    complexRouteTex = complexRouteTex ?? "Сложный маршрут";
    id = id ?? "";
  }

  String? televisionImage;

  String? complexRouteTex;

  String? id;
}
