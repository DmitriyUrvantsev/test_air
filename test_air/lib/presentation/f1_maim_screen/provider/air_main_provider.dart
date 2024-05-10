import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../core/app_export.dart';
import '../../../domain/all_tickets.dart';
import '../../../domain/offer.dart';
import '../../../domain/offers_tickets.dart';
import '../../../services/api_client.dart';
import '../../../widgets/custom_bottom_bar.dart';
import '../p1_main_page/air_main_page.dart';
import '../p2_select_country/models/select_country_model.dart';
import '../p2_select_country/select_country_screen.dart';
import '../p3_filters/filters_screen.dart';
import '../p4_see_all_tickets/models/k5_model.dart';
import '../p1_main_page/bottomsheet.dart';
import '../p1_main_page/models/p1_model.dart';
import '../p4_see_all_tickets/see_all_ticets_screen.dart';

class AirScreensProvider extends ChangeNotifier {
  final PrefUtils _prefUtils = PrefUtils();
  final _apiClient = ApiClient();
  //
  PageMainModel mainPageModelObj = PageMainModel();
  SelectCountryModel selectCountryModelObj = SelectCountryModel();
  SeeAllTicetsModel seeAllTicetsModelObj = SeeAllTicetsModel();

  ///--------------API loading------------------------
  Offer? _offers;
  Offer? get offers => _offers;
  OffersTickets? _offersTickets;
  OffersTickets? get offersTickets => _offersTickets;
  AllTickets? _tickets;
  AllTickets? get tickets => _tickets;
//
//
  ///--------------Departure-Arrival ------------------------
  TextEditingController departureController = TextEditingController();
  TextEditingController arrivalController = TextEditingController();
//
  String? _departureCity;
  String? get departureCity => _departureCity;
//
  String? _arrivalCity;
  String? get arrivalCity => _arrivalCity;
  //

  ///=============================================================================
  AirScreensProvider() {
    setup();
    _selectedDepartureDate = DateTime.now();
  }

  ///=============================================================================
  ///
  ///
  ///
  void setup() {
    //  _prefUtils.clearPreferencesData();
    final savedDepartureCity = _prefUtils.getdepartureCity();
    _departureCity =
        savedDepartureCity != "" ? _prefUtils.getdepartureCity() :   "lbl6_from_Moscow".tr;
  
    loadOffersData();
    loadOffersTicketsPost();
    loadAllTicketsPost();
  }

  ///-------------------API loading-----------------------------------------------
  Future<void> loadOffersData() async {
    try {
      _offers = await _apiClient.getOffersPost();
      notifyListeners();
    } catch (e) {}
  }

//
  Future<void> loadOffersTicketsPost() async {
    try {
      _offersTickets = await _apiClient.getOffersTicketsPost();
      notifyListeners();
    } catch (e) {}
  }

//
  Future<void> loadAllTicketsPost() async {
    try {
      _tickets = await _apiClient.getAllTicketsPost();
      notifyListeners();
    } catch (e) {}
  }

//--------
//
//
//
//
  ///--------------Departure-Arrival ------------------------
  void savedepartureCity() {
    _departureCity = departureController.text.isNotEmpty
        ? '${departureController.text.trim().substring(0, 1).toUpperCase()}${departureController.text.trim().substring(1).toLowerCase()}'
        : "lbl6".tr;
    _prefUtils.setdepartureCity(_departureCity ?? "lbl6".tr);
  }

//
  void setArrivalCity(String city) {
    _arrivalCity = city;
    arrivalController.text = city;

    notifyListeners();
  }

//
  void swapCities() {
    // Приключения убытия прибытия местами
    String? temp = _departureCity;
    _departureCity = _arrivalCity;
    _arrivalCity = temp;
    departureController.text = _departureCity ?? '';
    arrivalController.text = _arrivalCity ?? '';
    notifyListeners();
  }

  //--------
//
//
//
//
//
//
//
//========================календарь=============================================
  final dateFormat = DateFormat('dd MMM, E', 'ru');
  DateTime _selectedDepartureDate = DateTime.now();
  DateTime get selectedDepartureDate => _selectedDepartureDate;
  bool _isDepartureDate = false;
  bool get isDepartureDate => _isDepartureDate;
//
  DateTime _selectedArrivalDate = DateTime.now();
  DateTime get selectedArrivalDate => _selectedArrivalDate;
  bool _isArrivalDate = false;
  bool get isArrivalDate => _isArrivalDate;
//
//
  void selectDepartureDateCallback(
      void Function(DateTime) callback, context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDepartureDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (selectedDate != null) {
      _selectedDepartureDate = selectedDate;
      _isDepartureDate = true;
      notifyListeners();
      callback(selectedDate);
    }
  }

//
  void selectArrivalDateCallback(
      void Function(DateTime) callback, context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: _selectedArrivalDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      _selectedArrivalDate = selectedDate;
      _isArrivalDate = true;
      notifyListeners();
      callback(selectedDate);
    }
  }

//
//
//
//------------------------фильтры-----------------------------------------------
  bool isSelectedSwitch = false;
  bool isSelectedSwitch1 = false;
//
  void changeSwitchBox(bool value) {
    isSelectedSwitch = value;
    notifyListeners();
  }

//
  void changeSwitchBox1(bool value) {
    isSelectedSwitch1 = value;
    notifyListeners();
  }

//
//
//
//------------------------навигация BottomBar-----------------------------------
  // BottomBarEnum _currentScreen = BottomBarEnum.air;
  // BottomBarEnum get currentScreen => _currentScreen;
//
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
//
//
  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  //
  void changeIndex(BottomBarEnum screen) {
    switch (screen) {
      case BottomBarEnum.air:
        _currentIndex = 0;
        break;
      case BottomBarEnum.hotel:
        _currentIndex = 1;
        break;
      case BottomBarEnum.short:
        _currentIndex = 2;

        break;
      case BottomBarEnum.subscr:
        _currentIndex = 3;
        break;
      case BottomBarEnum.profile:
        _currentIndex = 4;
        break;
    }
    notifyListeners();
  }
//

  void showSelectCountry() {
    //NavigatorService.popAndPushNamed(AppRoutes.selectCountry);
    _currentWidget = SelectCountryPage();
    notifyListeners();
  }

  //
  onSeeAllTicets() {
    _currentWidget = SeeAllTicetsPage();
    notifyListeners();
  }

  //
  void showFilters() {
    _currentWidget = FiltersPage();
    notifyListeners();
  }

  //-----------------------Navigation Screens--------------------------------
  Widget _currentWidget = AirMainPage();
  Widget get currentWidget => _currentWidget;

  void showBottomSheetDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.all(0), // Убираем внутренние отступы
          child: SizedBox(
            // Ограничиваем размеры AlertDialog
            width: double.infinity, // Занимает всю ширину экрана
            child: BottomSheetPage(), // Ваш виджет K3BottomSheet
          ),
        );
      },
    );
  }

//

//

//
  // void goBack() {
  //   NavigatorService.goBack();
  // }

  @override
  void dispose() {
    super.dispose();
    departureController.dispose();
    arrivalController.dispose();
  }
}
