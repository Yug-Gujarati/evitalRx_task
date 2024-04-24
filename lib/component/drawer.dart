import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final Function(String)? onSelectFilter;
  const MyDrawer({super.key, this.onSelectFilter});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.lightBlue,
      child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                "Filter Data",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: TextButton(
                    onPressed: () {
                      onSelectFilter?.call('name');
                    },
                    child: Text(
                      "By Name",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: TextButton(
                    onPressed: () {
                      onSelectFilter?.call('phone');
                    },
                    child: Text(
                      "By Phone",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: TextButton(
                    onPressed: () {
                      onSelectFilter?.call('city');
                    },
                    child: Text(
                      "By City",
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ],
          )),
    );
  }
}
