import 'package:flutter/material.dart';
import '../../../../core/app_export.dart';
import '../k3_bottomsheet.dart';
import '../models/k1_model.dart';
import '../models/scr1_item_model.dart';

/// A provider class for the K1Page.
///
/// This provider manages the state of the K1Page, including the
/// current k1ModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class K1Provider extends ChangeNotifier {
  final PrefUtils _prefUtils = PrefUtils();
  TextEditingController departureController = TextEditingController();
  TextEditingController arrivalController = TextEditingController(); //!======

  K1Model k1ModelObj = K1Model();

  String? _departureCity;
  String? get departureCity => _departureCity;

  String? _arrivalCity;
  String? get arrivalCity => _arrivalCity;



  

  K1Provider() {
    setup();
  }

  void setup() {
    //_prefUtils.clearPreferencesData();
    final savedDepartureCity = _prefUtils.getdepartureCity();

    _departureCity = savedDepartureCity != "" //"lbl6".tr
        ? _prefUtils.getdepartureCity()
        : "lbl6".tr;
    // print(_departureCity);
  }

  void savedepartureCity() {
    _departureCity = departureController.text.isNotEmpty
        ? '${departureController.text.trim().substring(0, 1).toUpperCase()}${departureController.text.trim().substring(1).toLowerCase()}'
        : "lbl6".tr;
    _prefUtils.setdepartureCity(_departureCity ?? "lbl6".tr);

    print(_departureCity);
  }

  void setArrivalCity(String city) {
    _arrivalCity = city;
    arrivalController.text = city;
    print(_arrivalCity);
    notifyListeners(); // Уведомляем слушателей об изменении состояния
  }

  void nextStep(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.all(0), // Убираем внутренние отступы
          child: SizedBox(
            // Ограничиваем размеры AlertDialog
            width: double.infinity, // Занимает всю ширину экрана
            child: K3BottomSheet(), // Ваш виджет K3BottomSheet
          ),
        );
      },
    );
  }

  void swapCities() {
    String? temp = _departureCity;
    _departureCity = _arrivalCity;
    _arrivalCity = temp;
    departureController.text = _departureCity ?? '';
    arrivalController.text = _arrivalCity ?? '';
    notifyListeners();
  }



  void showSelectCountry() {
    NavigatorService.popAndPushNamed(AppRoutes.selectCountry);
  }

  void goBack() {
    NavigatorService.goBack();
  }

  @override
  void dispose() {
    super.dispose();
    departureController.dispose();
    arrivalController.dispose();
  }
}
