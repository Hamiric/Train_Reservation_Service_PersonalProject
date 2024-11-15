import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_reservation_service/controller/seat_controller.dart';
import 'package:train_reservation_service/controller/station_list_controller.dart';

class ReservationButton extends StatelessWidget {
  const ReservationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: GetBuilder<SeatController>(builder: (controller) {
        // 예매하기 버튼 누를시
        // CupertinoDialog 출력
        return ElevatedButton(
            onPressed: () {
              try {
                if (controller.readyReservation) {
                  showCupertinoDialog(
                    context: context,
                    builder: (BuildContext context) => popUpWindow(context),
                  );
                }
              } catch (e) {
                print('예매하기 팝업 출력 오류\n$e');
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                '예매 하기',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ));
      }),
    );
  }

  // content로 좌석 번호 출력 ( 세로줄 - 가로줄 >>예시>> 2 - B )
  // 취소 누를 경우 팝업창만 닫기
  // 확인 누를 경우, HomePage로 돌아가면서, 데이터 초기화
  Widget popUpWindow(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('예매 하시겠습니까?'),
      content: GetBuilder<SeatController>(builder: (controller) {
        return Text(controller.selectedrow != -1
            ? '좌석 : ${controller.selectedcol + 1}-${controller.stringRow[controller.selectedrow]}'
            : '');
      }),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          isDestructiveAction: true,
          child: const Text('취소'),
          onPressed: () {
            try {
              Navigator.pop(context);
            } catch (e) {
              print('팝업 취소시 오류\n$e');
            }
          },
        ),
        CupertinoDialogAction(
          isDefaultAction: true,
          child: const Text('확인'),
          onPressed: () {
            try{
              Navigator.pop(context);
              Get.back();
              Get.find<StationListController>().reset();
              Get.find<SeatController>().reset();
            } catch(e) {
              print('팝업 확인시 오류\n$e');
            }
          },
        ),
      ],
    );
  }
}
