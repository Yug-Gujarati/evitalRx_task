import 'package:flutter/material.dart';
import '../model/record_data.dart';

class RecordItem extends StatelessWidget {
  final RecordModel record;
  final int index;
  final Function(int) onUpdate;
  RecordItem({required this.record, required this.index, required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    String rupeeStatus = record.rupee < 50 ? 'Low' : 'High';
    Color textColor = record.rupee < 50 ? Colors.red : Colors.green;
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            int newRupee = record.rupee;
            return AlertDialog(
              title: Text("Enter New Rupee Value"),
              content: TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  newRupee = int.tryParse(value) ?? record.rupee;
                },
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();

                    onUpdate(newRupee);
                  },
                ),
              ],
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.lightBlue[50],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(
                    record.imgPath,
                  ),
                  radius: 25,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      record.name,
                      style: TextStyle(),
                    ),
                    Text(
                      record.phoneNo,
                    ),
                    Text(
                      record.city,
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('\$${record.rupee.toString()}'),
                    Text(
                      rupeeStatus,
                      style: TextStyle(color: textColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
