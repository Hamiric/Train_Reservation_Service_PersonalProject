import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_reservation_service/controller/seat_controller.dart';
import 'package:train_reservation_service/controller/station_list_controller.dart';

import 'package:train_reservation_service/home_page/homepage.dart';
import 'package:train_reservation_service/seat_page/seatpage.dart';
import 'package:train_reservation_service/station_list_page/station_list_page.dart';
import 'package:train_reservation_service/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Train Reservation Service App',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: lightTheme,
      getPages: [
        GetPage(name: '/HomePage', page: () => HomePage()),
        GetPage(name: '/StationListPage', page: () => StationListPage()),
        GetPage(name: '/SeatPage', page: () => SeatPage()),
      ],
      initialBinding: BindingsBuilder(() {
        Get.lazyPut<StationListController>(()=> StationListController());
        Get.lazyPut<SeatController>(()=> SeatController());
      }),
      home: const HomePage(),
    );
  }
}