import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_reservation_service/controller/station_list_controller.dart';
import 'package:train_reservation_service/controller/theme_controller.dart';
import 'package:train_reservation_service/home_page/seat_selection_button.dart';
import 'package:train_reservation_service/home_page/station_box.dart';
import 'package:train_reservation_service/logger.dart';

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
          IconButton(
            onPressed: () {
              try {
                Get.find<ThemeController>().changeThemeMode();
              } catch (e) {
                logger.e('테마모드 변경 버튼 오류');
              }
            },
            icon: Icon(
              Theme.of(context).colorScheme.brightness == Brightness.light
                  ? Icons.mode_night
                  : Icons.sunny,
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      backgroundColor:
          Theme.of(context).colorScheme.brightness == Brightness.light
              ? Colors.grey[200]
              : Color(0xff121212),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 출발역-도착역을 스왑해주는 버튼
            IconButton(
                onPressed: () {
                  try {
                    Get.find<StationListController>().swapStation();
                  } catch (e) {
                    logger.e('출발역-도착역 스왑버튼 오류');
                  }
                },
                icon: Icon(
                  Icons.swap_horiz,
                  size: 40,
                )),
            // 출발역, 도착역을 감싸고 있는 박스
            StationBox(),
            SizedBox(
              height: 20,
            ),
            // 좌석 선택 버튼
            SeatSelectionButton(),
            // IconButton 크기 만큼 SizedBox 만들어서 중앙 맞추기
            SizedBox(
              height: 56,
            )
          ],
        ),
      ),
    );
  }
}
