import 'package:flutter/material.dart';

class Seats extends StatelessWidget {
  const Seats({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (BuildContext context, index) {
          return seatList(index);
        }
      )
    );
  }

  Widget seatList(int idx){
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Spacer(),
          seat(),
          SizedBox(width: 4,),
          seat(),
          SizedBox(width: 4,),
          SizedBox(
            width: 50,
            height: 50,
            child: Center(
              child: Text(
                (idx+1).toString(),
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
          SizedBox(width: 4,),
          seat(),
          SizedBox(width: 4,),
          seat(),
          Spacer(),
        ],
      ),
    );
  }

  Widget seat(){
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
