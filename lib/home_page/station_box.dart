import 'package:flutter/material.dart';

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
    return Column(
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
    );
  }
}