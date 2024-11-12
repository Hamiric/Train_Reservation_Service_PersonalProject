import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SeatSelectionButton extends StatelessWidget {
  const SeatSelectionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Get.toNamed('/SeatPage');
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              '좌석 선택',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
    );
  }
}
