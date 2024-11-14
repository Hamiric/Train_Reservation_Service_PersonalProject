import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_reservation_service/controller/theme_controller.dart';
import 'package:train_reservation_service/home_page/seat_selection_button.dart';
import 'package:train_reservation_service/home_page/station_box.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('기차 예매'),
        actions: [
          // 테마 모드 변경을 위한 아이콘 추가
          GestureDetector(
            onTap: () {
              Get.find<ThemeController>().changeThemeMode();
            },
            child: Icon(
              Theme.of(context).colorScheme.brightness == Brightness.light ? Icons.mode_night : Icons.sunny,
            )
          ),
          SizedBox(width: 20,),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.brightness == Brightness.light ? Colors.grey[200] : Color(0xff121212),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 출발역, 도착역을 감싸고 있는 박스
            StationBox(),
            SizedBox(height: 20,),
            // 좌석 선택 버튼
            SeatSelectionButton(),
          ],
        ),
      ),
    );
  }
}