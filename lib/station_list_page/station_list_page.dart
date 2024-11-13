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

              // index번째 반복중일때, 스킵하고 싶은 목록의 Index를 넘는 visibleIndex를 설정하는 로직
              // 예를 들면, 0 ~ 3 의 목록중 2를 뛰어넘고자 할때,
              // index가 0 ~ 3 이면, visibleIndex는 0,1,3 이 출력
              // (뛰어 넘는다 했을때 index는 itemCount값이 -1이 되어 개수가 하나 줄음)
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
