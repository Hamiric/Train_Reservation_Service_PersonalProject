import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_reservation_service/controller/station_list_controller.dart';
import 'package:train_reservation_service/logger.dart';

class StationBox extends StatelessWidget {
  const StationBox({super.key});

  @override
  Widget build(BuildContext context) {
    const bool START_STATION = true;
    const bool END_STATION = false;

    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          // 출발역
          station(START_STATION, context),
          // 세로선
          SizedBox(
            height: 50,
            child: VerticalDivider(
              thickness: 2,
              color: Theme.of(context).dividerColor,
            ),
          ),
          // 도착역
          station(END_STATION, context),
        ],
      ),
    );
  }

  Widget station(bool stationType, BuildContext context) {
    return Expanded(
      // 각 Text위젯을 클릭하면
      // StationListController에 출발역/도착역 데이터를 전달하고
      // StationListPage로 이동
      child: GestureDetector(
        onTap: () {
          try {
            Get.find<StationListController>().setStationType(stationType);
            Get.toNamed('/StationListPage');
          } catch (e) {
            logger.e('StationListPage이동중 오류');
          }
        },
        child: Container(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                stationType ? '출발역' : '도착역',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // StationListController에 저장되어있는 station값을 읽어서 text에 반영
              // default text는 '선택'
              GetBuilder<StationListController>(builder: (controller) {
                return Text(
                    stationType ? controller.startStation : controller.endStation,
                    style: TextStyle(
                      fontSize: 40,
                      color: Theme.of(context).colorScheme.brightness ==
                              Brightness.light
                          ? null
                          : Colors.white,
                    ));
              })
            ],
          ),
        ),
      ),
    );
  }
}
