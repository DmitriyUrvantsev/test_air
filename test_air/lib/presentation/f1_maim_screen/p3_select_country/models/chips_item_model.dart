/// This class is used in the [chips_item_widget] screen.

// ignore_for_file: must_be_immutable
class ChipsItemModel {
  ChipsItemModel({this.buttonsmall, this.isSelected}) {
    buttonsmall = buttonsmall ?? "обратно";
    isSelected = isSelected ?? false;
  }

  String? buttonsmall;

  bool? isSelected;
}
