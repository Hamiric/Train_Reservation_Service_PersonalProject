import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_reservation_service/controller/seat_controller.dart';
import 'package:train_reservation_service/controller/station_list_controller.dart';

import 'package:train_reservation_service/home_page/home_page.dart';
import 'package:train_reservation_service/seat_page/seat_page.dart';
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
        Get.put(StationListController());
        Get.put(SeatController());
      }),
      home: const HomePage(),
    );
  }
}