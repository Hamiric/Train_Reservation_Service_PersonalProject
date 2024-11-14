import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_reservation_service/controller/seat_controller.dart';
import 'package:train_reservation_service/controller/station_list_controller.dart';

class SeatSelectionButton extends StatelessWidget {
  const SeatSelectionButton({super.key});

  @override
  Widget build(BuildContext context) {
    // 출발역, 도착역이 둘다 선택되어 있는 경우에만 버튼 작동
    return GetBuilder<StationListController>(builder: (controller) {
      return ElevatedButton(
          onPressed: () {
            if (controller.changedstart && controller.changedend) {
              Get.toNamed('/SeatPage');
              Get.find<SeatController>().setStation(controller.startStation, controller.endStation);
            }
          },
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                '좌석 선택',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ));
    });
  }
}
