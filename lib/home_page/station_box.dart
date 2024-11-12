import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_reservation_service/controller/station_list_page_controller.dart';

class StationBox extends StatelessWidget {
  const StationBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Spacer(),
          station('출발역'),
          Spacer(),
          SizedBox(
            height: 50,
            child: VerticalDivider(
              thickness: 2,
            ),
          ),
          Spacer(),
          station('도착역'),
          Spacer(),
        ],
      ),
    );
  }

  Widget station(String stationtype){
    return GestureDetector(
      onTap: () {
        Get.find<StationListPageController>().setStationType(stationtype);
        Get.toNamed('/StationListPage');
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            stationtype,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '선택',
            style: TextStyle(
              fontSize: 40,
            ),
          )
        ],
      ),
    );
  }
}