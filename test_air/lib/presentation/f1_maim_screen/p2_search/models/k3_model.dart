import '../../../../core/app_export.dart';
import 'userprofile1_item_model.dart';
import 'viewhierarchy_item_model.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class K3Model {
  List<ViewhierarchyItemModel> viewhierarchyItemList = [
    ViewhierarchyItemModel(
        televisionImage: ImageConstant.imgTelevision,
        complexRouteTex: "Сложный маршрут"),
    ViewhierarchyItemModel(
        televisionImage: ImageConstant.imgGlobe,
        complexRouteTex: "Куда угодно"),
    ViewhierarchyItemModel(
        televisionImage: ImageConstant.imgCalendar,
        complexRouteTex: "Выходные"),
    ViewhierarchyItemModel(
        televisionImage: ImageConstant.imgFire,
        complexRouteTex: "Горячие билеты")
  ];

  List<Userprofile1ItemModel> userprofile1ItemList = [
    Userprofile1ItemModel(
        userImage: ImageConstant.imgRectangle288,
        username: "Стамбул",
        description: "Популярное направление"),
    Userprofile1ItemModel(
        userImage: ImageConstant.imgRectangle28840x40,
        username: "Сочи",
        description: "Популярное направление"),
    Userprofile1ItemModel(
        userImage: ImageConstant.imgRectangle2881,
        username: "Пхукет",
        description: "Популярное направление")
  ];
}
