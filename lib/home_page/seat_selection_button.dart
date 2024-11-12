import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_reservation_service/controller/station_list_controller.dart';

class SeatSelectionButton extends StatelessWidget {
  const SeatSelectionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StationListController>(builder: (controller) {
      return ElevatedButton(
          onPressed: () {
            if (controller.changedstart && controller.changedend) {
              Get.toNamed('/SeatPage');
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
