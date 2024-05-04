import 'package:flutter/material.dart';
import 'package:urvandeniss_s_1/presentation/f3_placeholders/s1_hotels.dart';
import 'package:urvandeniss_s_1/presentation/f3_placeholders/s4_profile.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../f1_maim_screen/p1_main_page/air_main_page.dart';
import '../f3_placeholders/s2_shorter.dart';
import '../f3_placeholders/s3_subscription.dart';


class PageBuilderScreen extends StatefulWidget {
  const PageBuilderScreen({Key? key})
      : super(
          key: key,
        );

  @override
  PageBuilderScreenState createState() => PageBuilderScreenState();
  static Widget builder(BuildContext context) {
    return PageBuilderScreen();
  }
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class PageBuilderScreenState extends State<PageBuilderScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    // Future.delayed(const Duration(milliseconds: 3000), () {
    //   NavigatorService.popAndPushNamed(
    //     AppRoutes.k4Screen,
    // );
    //});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: navigatorKey,
        initialRoute: AppRoutes.airMainPage,
        onGenerateRoute: (routeSetting) => PageRouteBuilder(
          pageBuilder: (ctx, ani, ani1) =>
              getCurrentPage(context, routeSetting.name!),
          transitionDuration: Duration(seconds: 0),
        ),
      ),
      bottomNavigationBar: _buildBottomBar(context),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Navigator.pushNamed(
            navigatorKey.currentContext!, getCurrentRoute(type));
      },
    );
  }

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

      //    case AppRoutes.k1Page:
      //   return K1Page.builder(context);
      // case AppRoutes.kHotelPage: // Добавлен новый маршрут для страницы отеля
      //   return HotelPage();
      // case AppRoutes.kOtherPage: // Добавлен новый маршрут для другой страницы
      //   return OtherPage();

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
        return AirMainPage.builder(context);

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
}
