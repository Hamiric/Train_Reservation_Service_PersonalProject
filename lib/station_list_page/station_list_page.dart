import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_reservation_service/controller/station_list_controller.dart';

class StationListPage extends StatelessWidget {
  const StationListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: GetBuilder<StationListController>(builder: (controller) {
          return controller.stationtype ? Text('출발역') : Text('도착역');
        }),
      ),
      body: GetBuilder<StationListController>(builder: (controller) {
        return ListView(
          children: [
            ...List.generate(
                controller.checkOppositionList
                    ? controller.stationName.length - 1
                    : controller.stationName.length, (index) {
              int visibleIndex = index;
              if (controller.checkOppositionList) {
                if (controller.stationtype) {
                  visibleIndex = index >= controller.selectedEndStationIndex
                      ? index + 1
                      : index;
                } else {
                  visibleIndex = index >= controller.selectedStartStationIndex
                      ? index + 1
                      : index;
                }
              }

              if (visibleIndex == controller.selectedEndStationIndex &&
                  controller.stationtype) {
                return const SizedBox.shrink();
              } else if (visibleIndex == controller.selectedStartStationIndex &&
                  !controller.stationtype) {
                return const SizedBox.shrink();
              }
              
              return stationList(
                  controller.stationName[visibleIndex], visibleIndex);
            }),
          ],
        );
      }),
    );
  }

  Widget stationList(String station, int index) {
    return GestureDetector(
      onTap: () {
        Get.find<StationListController>().setStation(station, index);
        Get.back();
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey[300]!))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              station,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
