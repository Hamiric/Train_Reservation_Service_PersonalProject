import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_reservation_service/controller/station_list_controller.dart';

class TrainRouteBox extends StatelessWidget {
  const TrainRouteBox({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StationListController>(
      builder: (controller) {
        return Row(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  controller.startStation,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Icon(
              Icons.arrow_circle_right_outlined,
              size: 30,
            ),
            Expanded(
              child: Center(
                child: Text(
                  controller.endStation,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        );
      }
    );
  }
}