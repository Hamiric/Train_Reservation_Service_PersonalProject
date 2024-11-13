import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_reservation_service/controller/station_list_controller.dart';

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
          station(START_STATION, context),
          SizedBox(
            height: 50,
            child: VerticalDivider(
              thickness: 2,
              color: Theme.of(context).dividerColor,
            ),
          ),
          station(END_STATION, context),
        ],
      ),
    );
  }

  Widget station(bool stationType, BuildContext context){
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Get.find<StationListController>().setStationType(stationType);
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
            GetBuilder<StationListController>(
              builder: (controller) {
                return Text(
                  stationType ? controller.startStation : controller.endStation,
                  style: Theme.of(context).textTheme.bodyMedium,
                );
              }
            )
          ],
        ),
      ),
    );
  }
}