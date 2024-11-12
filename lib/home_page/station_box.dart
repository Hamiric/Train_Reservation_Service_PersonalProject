import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_reservation_service/controller/station_list_page_controller.dart';

class StationBox extends StatelessWidget {
  const StationBox({super.key});

  @override
  Widget build(BuildContext context) {
    const bool START_STATION = true;
    const bool END_STATION = false;

    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Spacer(),
          station(START_STATION),
          Spacer(),
          SizedBox(
            height: 50,
            child: VerticalDivider(
              thickness: 2,
            ),
          ),
          Spacer(),
          station(END_STATION),
          Spacer(),
        ],
      ),
    );
  }

  Widget station(bool stationType){
    return GestureDetector(
      onTap: () {
        Get.find<StationListPageController>().setStationType(stationType);
        Get.toNamed('/StationListPage');
      },
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
          GetBuilder<StationListPageController>(
            builder: (controller) {
              return Text(
                stationType ? controller.startStation : controller.endStation,
                style: TextStyle(
                  fontSize: 40,
                ),
              );
            }
          )
        ],
      ),
    );
  }
}