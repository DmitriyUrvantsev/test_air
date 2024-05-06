/// This class is used in the [chips_item_widget] screen.

// ignore_for_file: must_be_immutable
class SettingItemModel {
  SettingItemModel({this.iconButton, this.iconText, this.functtion}) {
    //iconButton = iconButton ?? '';
    // isSelected = isSelected ?? false;
  }

  String? iconButton;
  String? iconText;
  Function()? functtion;
  // bool? isSelected;
}
