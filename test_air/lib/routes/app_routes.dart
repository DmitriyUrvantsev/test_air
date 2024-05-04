import 'package:flutter/material.dart';
import '../core/app_export.dart';
//import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/f0_page_builder/page_builder_screen.dart';
import '../presentation/f1_maim_screen/p1_main_page/air_main_page.dart';
import '../presentation/f1_maim_screen/p4_filters/k0_screen.dart';
import '../presentation/f1_maim_screen/p3_select_country/k4_screen.dart';
import '../presentation/f1_maim_screen/p5_see_all_tickets/k5_screen.dart';
import '../presentation/f3_placeholders/s1_hotels.dart';
import '../presentation/f3_placeholders/s2_shorter.dart';
import '../presentation/f3_placeholders/s3_subscription.dart';
import '../presentation/f3_placeholders/s4_profile.dart';

class AppRoutes {


  static const String pageBuilderScreen = '/';

static const String airMainPage ='/air_main_page';
static const String hotels ='/hotels';
static const String short ='/short';
static const String subscr ='/subscr';
static const String profile ='/profile';





  static const String k0Screen = '/k0_screen';

  //static const String k1Page = '/k1_page';


  static const String k4Screen = '/k4_screen';

  static const String k5Screen = '/k5_screen';

  //static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        pageBuilderScreen: PageBuilderScreen.builder,

         airMainPage: AirMainPage.builder,
         hotels: (context) => HotelsPage(),
         short: (context) => ShorterPage(),
         subscr: (context) => SubscriptionPage(),
         profile: (context) => ProfilePage(),
       



        k0Screen: K0Screen.builder,
        k4Screen: K4Screen.builder,
        k5Screen: K5Screen.builder,
        // appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: PageBuilderScreen.builder
      };
}
