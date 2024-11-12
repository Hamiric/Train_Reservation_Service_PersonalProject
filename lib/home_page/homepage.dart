import 'package:flutter/material.dart';
import 'package:train_reservation_service/home_page/seat_selection_button.dart';
import 'package:train_reservation_service/home_page/station_box.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('기차 예매'),
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StationBox(),
            SizedBox(height: 20,),
            SeatSelectionButton(),
          ],
        ),
      ),
    );
  }
}