import '../../../../core/app_export.dart';

/// This class is used in the [userprofile_item_widget] screen.
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class Scr1ItemModel {
  Scr1ItemModel(
      {this.userImage,
      this.userName,
      this.location,
      this.flightPrice,
      this.id}) {
    userImage = userImage ?? ImageConstant.imgRectangle287;
    userName = userName ?? "Die Antwoord";
    location = location ?? "Будапешт";
    flightPrice = flightPrice ?? "от 22 264 ₽ ";
    id = id ?? "";
  }

  String? userImage;

  String? userName;

  String? location;

  String? flightPrice;

  String? id;
}
