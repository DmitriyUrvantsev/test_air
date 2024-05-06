// ignore_for_file: public_member_api_docs, sort_constructors_first
/// This class is used in the [chips_item_widget] screen.

class SettingItemModel {
  final String? iconButton;
  final String? iconText;
  

  final void Function(DateTime)? onSelectDate; // Колбэк для выбора даты
 
  SettingItemModel({
    this.iconButton,
    this.iconText,
  
   
    this.onSelectDate,
  });


}
