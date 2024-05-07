/// This class is used in the [userprofile2_item_widget] screen.

// ignore_for_file: must_be_immutable
class Userprofile2ItemModel {
  Userprofile2ItemModel(
      {this.price,
      this.time,
      this.destination,
      this.time1,
      this.destination1,
      this.buttonsmall,
      this.id}) {
    price = price ?? "6 990 ₽ ";
    time = time ?? "03:15";
    destination = destination ?? "VKO ";
    time1 = time1 ?? "07:10";
    destination1 = destination1 ?? "AER";
    buttonsmall = buttonsmall ?? "Самый удобный";
    id = id ?? "";
  }

  String? price;

  String? time;

  String? destination;

  String? time1;

  String? destination1;

  String? buttonsmall;

  String? id;
}
