import 'package:flutter/material.dart';
//import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import 'page_builder_screen.dart';
import '../presentation/f1_maim_screen/p1_main_page/widgets/search_placeholders/anywhere.dart';
import '../presentation/f1_maim_screen/p1_main_page/widgets/search_placeholders/difficult_route.dart';
import '../presentation/f1_maim_screen/p1_main_page/widgets/search_placeholders/hotTickets.dart';
import '../presentation/f1_maim_screen/p1_main_page/widgets/search_placeholders/weekend.dart';


class AppRoutes {
  static const String pageBuilderScreen = '/';
// ----------------tabs ----------------------
  static const String airMainPage = '/air_main_page';
  static const String hotels = '/hotels';
  static const String short = '/short';
  static const String subscr = '/subscr';
  static const String profile = '/profile';
  //--------------stubs-----------------------
  static const String difficultRoute = '/difficultRoute';
  static const String anywhere = '/anywhere';
  static const String weekend = '/weekend';
  static const String hotTickets = '/hotTickets';
//--------------airMainPage-----------------------
  static const String selectCountry = '/selectCountry';
  static const String filtersScreen = '/filtersScreen';
  static const String seeAllTicets = '/k5_screen';



  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        pageBuilderScreen: (context) => PageBuilderScreen(),
        // hotels: (context) => HotelsPage(),
        // short: (context) =>  ShorterPage(),
        // subscr: (context) => SubscriptionPage(),
        // profile: (context) => ProfilePage(),
        //-------------DifficultRoute--------------
        difficultRoute: (context) => DifficultRoute(),
        anywhere: (context) => Anywhere(),
        weekend: (context) => Weekend(),
        hotTickets: (context) => HotTickets(),
   
        initialRoute: (context) => PageBuilderScreen()
      };
}
