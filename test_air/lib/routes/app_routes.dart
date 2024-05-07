import 'package:flutter/material.dart';
import '../core/app_export.dart';
//import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import 'page_builder_screen.dart';
import '../presentation/f1_maim_screen/p1_main_page/air_main_page.dart';
import '../presentation/f1_maim_screen/p1_main_page/widgets/search_placeholders/anywhere.dart';
import '../presentation/f1_maim_screen/p1_main_page/widgets/search_placeholders/difficult_route.dart';
import '../presentation/f1_maim_screen/p1_main_page/widgets/search_placeholders/hotTickets.dart';
import '../presentation/f1_maim_screen/p1_main_page/widgets/search_placeholders/weekend.dart';
import '../presentation/f1_maim_screen/p3_filters/filters_screen.dart';
import '../presentation/f1_maim_screen/p2_select_country/select_country_screen.dart';
import '../presentation/f1_maim_screen/p4_see_all_tickets/see_all_ticets_screen.dart';
import '../presentation/f3_placeholders/s1_hotels.dart';
import '../presentation/f3_placeholders/s2_shorter.dart';
import '../presentation/f3_placeholders/s3_subscription.dart';
import '../presentation/f3_placeholders/s4_profile.dart';

class AppRoutes {
  static const String pageBuilderScreen = '/';

  static const String airMainPage = '/air_main_page';
  static const String hotels = '/hotels';
  static const String short = '/short';
  static const String subscr = '/subscr';
  static const String profile = '/profile';
  //-------------DifficultRoute--------------
  static const String difficultRoute = '/difficultRoute';
  static const String anywhere = '/anywhere';
  static const String weekend = '/weekend';
  static const String hotTickets = '/hotTickets';

  //static const String k1Page = '/k1_page';

  static const String selectCountry = '/selectCountry';
  static const String filtersScreen = '/filtersScreen';

  static const String seeAllTicets = '/k5_screen';

  //static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        pageBuilderScreen: PageBuilderScreen.builder,

        airMainPage: AirMainPage.builder,
        hotels: (context) => HotelsPage(),
        short: (context) => ShorterPage(),
        subscr: (context) => SubscriptionPage(),
        profile: (context) => ProfilePage(),
        //-------------DifficultRoute--------------
        difficultRoute: (context) => DifficultRoute(),
        anywhere: (context) => Anywhere(),
        weekend: (context) => Weekend(),
        hotTickets: (context) => HotTickets(),

        filtersScreen: FiltersScreen.builder,
        selectCountry: (context) => SelectCountryScreen(),

        seeAllTicets: K5Screen.builder,
        // appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: PageBuilderScreen.builder
      };
}
