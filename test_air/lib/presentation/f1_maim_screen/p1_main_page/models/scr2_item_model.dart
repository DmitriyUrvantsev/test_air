import '../../../../core/app_export.dart';

/// This class is used in the [userprofile1_item_widget] screen.
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class Scr2ItemModel {
  Scr2ItemModel({this.userImage, this.username, this.description, this.id}) {
    userImage = userImage ?? ImageConstant.imgRectangle288;
    username = username ?? "Стамбул";
    description = description ?? "Популярное направление";
    id = id ?? "";
  }

  String? userImage;
  String? username;
  String? description;
  String? id;
}
