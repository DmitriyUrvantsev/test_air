import 'package:flutter/material.dart';
import 'package:urvandeniss_s_1/presentation/f3_placeholders/s1_hotels.dart';
import 'package:urvandeniss_s_1/presentation/f3_placeholders/s4_profile.dart';
import '../core/app_export.dart';
import '../presentation/f1_maim_screen/provider/air_main_provider.dart';
import '../widgets/custom_bottom_bar.dart';
import '../presentation/f1_maim_screen/p1_main_page/air_main_page.dart';
import '../presentation/f3_placeholders/s2_shorter.dart';
import '../presentation/f3_placeholders/s3_subscription.dart';

class PageBuilderScreen extends StatefulWidget {
  const PageBuilderScreen({Key? key}) : super(key: key);

  @override
  PageBuilderScreenState createState() => PageBuilderScreenState();
}

class PageBuilderScreenState extends State<PageBuilderScreen> {
  late AirScreensProvider provider;
  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  @override
  Widget build(BuildContext context) {
   provider = context.watch<AirScreensProvider>();
    return Scaffold(
      body: IndexedStack(
        index: provider.currentIndex,
        children: [
          Navigator(
            key: _navigatorKeys[0],
            initialRoute: AppRoutes.airMainPage,
            onGenerateRoute: (routeSetting) => PageRouteBuilder(
              pageBuilder: (ctx, ani, ani1) => provider.currentWidget,
              transitionDuration: Duration(seconds: 0),
            ),
          ),
          Navigator(
            key: _navigatorKeys[1],
            initialRoute: AppRoutes.hotels,
            onGenerateRoute: (routeSetting) => PageRouteBuilder(
              pageBuilder: (ctx, ani, ani1) => HotelsPage(),
              transitionDuration: Duration(seconds: 0),
            ),
          ),
          Navigator(
            key: _navigatorKeys[2],
            initialRoute: AppRoutes.short,
            onGenerateRoute: (routeSetting) => PageRouteBuilder(
              pageBuilder: (ctx, ani, ani1) => ShorterPage(),
              transitionDuration: Duration(seconds: 0),
            ),
          ),
          Navigator(
            key: _navigatorKeys[3],
            initialRoute: AppRoutes.subscr,
            onGenerateRoute: (routeSetting) => PageRouteBuilder(
              pageBuilder: (ctx, ani, ani1) => SubscriptionPage(),
              transitionDuration: Duration(seconds: 0),
            ),
          ),
          Navigator(
            key: _navigatorKeys[4],
            initialRoute: AppRoutes.profile,
            onGenerateRoute: (routeSetting) => PageRouteBuilder(
              pageBuilder: (ctx, ani, ani1) => ProfilePage(),
              transitionDuration: Duration(seconds: 0),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomBar(context),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      currentIndex: provider.currentIndex,
      onChanged: (selectedTab) {
        provider.changeIndex(selectedTab);
      },
    );
  }
}

/// Section Widget
// Widget _buildBottomBar(BuildContext context) {
//   return
//   CustomBottomBar(
//     onChanged: (BottomBarEnum type) {
//       // Переключаемся на другую вкладку
//       switch (type) {
//         case BottomBarEnum.air:
//           airKey.currentState?.pushReplacementNamed(AppRoutes.airMainPage);
//           break;
//         case BottomBarEnum.hotel:
//           hotelKey.currentState?.pushReplacementNamed(AppRoutes.hotels);
//           break;
//         case BottomBarEnum.short:
//           shortKey.currentState?.pushReplacementNamed(AppRoutes.short);
//           break;
//         case BottomBarEnum.subscr:
//           subscrKey.currentState?.pushReplacementNamed(AppRoutes.subscr);
//           break;
//         case BottomBarEnum.profile:
//           profileKey.currentState?.pushReplacementNamed(AppRoutes.profile);
//           break;
//         default:
//           break;
//       }
//     },
//   );

//   // CustomBottomBar(
//   //   onChanged: (BottomBarEnum type) {
//   //     Navigator.pushNamed(
//   //         navigatorKey.currentContext!, getCurrentRoute(type));
//   //   },
//   // );
// }

///Handling route based on bottom click actions
String getCurrentRoute(BottomBarEnum type) {
  switch (type) {
    case BottomBarEnum.air:
      return AppRoutes.airMainPage;

    case BottomBarEnum.hotel:
      return AppRoutes.hotels;

    case BottomBarEnum.short:
      return AppRoutes.short;

    case BottomBarEnum.subscr:
      return AppRoutes.subscr;

    case BottomBarEnum.profile:
      return AppRoutes.profile;

    default:
      return "/";
  }
}

///Handling page based on route
Widget getCurrentPage(
  BuildContext context,
  String currentRoute,
) {
  switch (currentRoute) {
    case AppRoutes.airMainPage:
      return AirMainPage();

    case AppRoutes.hotels:
      return HotelsPage();

    case AppRoutes.short:
      return ShorterPage();
    case AppRoutes.subscr:
      return SubscriptionPage();
    case AppRoutes.profile:
      return ProfilePage();

    default:
      return DefaultWidget();
  }
}
