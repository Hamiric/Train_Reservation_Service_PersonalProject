import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_reservation_service/controller/station_list_controller.dart';
import 'package:train_reservation_service/controller/theme_controller.dart';

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
        actions: [
          // 테마 모드 변경을 위한 아이콘 추가
          GestureDetector(
              onTap: () {
                Get.find<ThemeController>().changeThemeMode();
              },
              child: Icon(
                Theme.of(context).colorScheme.brightness == Brightness.light
                    ? Icons.mode_night
                    : Icons.sunny,
              )),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: GetBuilder<StationListController>(builder: (controller) {
        return ListView(
          children: [
            ...List.generate(
              // ItemCount 설정시
              // 반대역을 이미 설정한 경우, 선택된 반대역은 출력이 되지 않아야 한다.
              // 즉, 해당 경우 목록개수가 -1이 되고, 이외의 경우는 목록개수는 그대로
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

              // (사담) 어플 테스트 및 코드 검토해보면서 생각해보니..
              // ItemCount 안건들이고, 비워야할 index에서 shrink() 리턴해 주면 훨씬 편하고, 리소스도 적게 드는게 아닌가
              // 라는 생각을 했지만, 위의 코드를 적는데 들인 수고 및 시간이 아까워서 놔둠.
              return stationList(
                  controller.stationName[visibleIndex], visibleIndex);
            }),
          ],
        );
      }),
    );
  }

  Widget stationList(String station, int index) {
    // 리스트 목록 터치시, station과 index값을 StationListController에 전달
    // 이후, SationListPage 종료
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
