import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_reservation_service/controller/seat_controller.dart';

class ReservationButton extends StatelessWidget {
  const ReservationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: GetBuilder<SeatController>(
        builder: (controller) {
          return ElevatedButton(
            onPressed: () {
              if(controller.readyReservation){
                showCupertinoDialog(
                  context: context, 
                  builder: (BuildContext context) => popUpWindow(context),
                );
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
            )
          );
        }
      ),
    );
  }

  Widget popUpWindow(BuildContext context){
    return CupertinoAlertDialog(
      title: const Text('예매 하시겠습니까?'),
      content: GetBuilder<SeatController>(
        builder: (controller) {
          return Text('좌석 : ${controller.selectedcol + 1}-${controller.stringRow[controller.selectedrow]}');
        }
      ),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          isDestructiveAction: true,
          child: const Text('취소'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        CupertinoDialogAction(
          isDefaultAction: true,
          child: const Text('확인'),
          onPressed: () {
            Navigator.pop(context);
            Get.back();
          },
        ),
      ],
    );
  }
}