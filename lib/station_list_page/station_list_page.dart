import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_reservation_service/controller/station_list_page_controller.dart';

class StationListPage extends StatelessWidget {
  StationListPage({super.key});

  final List<String> stationName = [
    '수서',
    '동탄',
    '평택지제',
    '천안아산',
    '오송',
    '대전',
    '김천구미',
    '동대구',
    '경주',
    '울산',
    '부산'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: GetBuilder<StationListPageController>(
          builder: (controller) {
            return Text(controller.stationtype);
          }
        ),
      ),
      body: ListView.builder(
        itemCount: stationName.length,
        itemBuilder: (BuildContext context, int index) {
        return stationList(stationName[index]);
      }),
    );
  }

  Widget stationList(String station) {
    return GestureDetector(
      onTap: () {
        // 
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[300]!))
        ),
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
