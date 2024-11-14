import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_reservation_service/controller/theme_controller.dart';
import 'package:train_reservation_service/seat_page/reservation_button.dart';
import 'package:train_reservation_service/seat_page/seat_label.dart';
import 'package:train_reservation_service/seat_page/seats.dart';
import 'package:train_reservation_service/seat_page/train_route_box.dart';

class SeatPage extends StatelessWidget {
  const SeatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('좌석 선택'),
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        actions: [
          // 테마 모드 변경을 위한 아이콘 추가
          GestureDetector(
              onTap: () {
                Get.find<ThemeController>().changeThemeMode();
              },
              child: Icon(
                Theme.of(context).colorScheme.brightness == Brightness.light
                    ? Icons.mode_night
                    : Icons.sunny,
              )),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // 출발역, 도착역
            TrainRouteBox(),
            // 좌석 상태 박스
            SeatLabel(),
            // 좌석들
            Seats(),
            // 예매하기 버튼
            ReservationButton(),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
