import 'package:booking_hotel/Views/HomePage.dart';
import 'package:booking_hotel/Views/LoginPage.dart';
import 'package:booking_hotel/Views/RegisterPage.dart';
import 'package:get/get.dart';

import 'package:booking_hotel/Controllers/WebController.dart';
import 'package:booking_hotel/Views/WebviewNearby.dart';

import '../Views/Profil.dart';
import 'package:booking_hotel/Views/HotelView.dart';

class AppRoutes {
  static final pages = [
    GetPage(
      name: '/home',
      page: () => HomePage(),
      binding: BindingsBuilder(() {
      }),
    ),
    GetPage(
      name: '/registration',
      page: () => RegisterPage()
    ),
    GetPage(
      name: '/login',
      page: () => LoginPage()
    ),
    GetPage(
      name: '/profil',
      page: () => ProfilPage(),
    ),
    GetPage(
      name: '/database',
      page: () => BudgetScreen(),
    ),
    GetPage(
      name: '/webnearby',
      page: () => const WebviewNearby(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => WebviewhotelController());
      }),
    ),
  ];
}