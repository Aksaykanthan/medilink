import 'package:flutter/material.dart';

class UpcomingAppCard extends StatelessWidget {
  const UpcomingAppCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      height: 150,
      width: 340,
      // color: Colors.grey,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 8,
                offset: const Offset(0, 6)),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.person,
                size: 50,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text("dentist | royal ")
                ],
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width: 130,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[300]),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                            start: 8.0, end: 3.0),
                        child: Icon(
                          Icons.calendar_month,
                          color: Colors.black,
                        ),
                      ),
                      Text("12-05-2005"),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width: 130,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[300]),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                            start: 8.0, end: 3.0),
                        child: Icon(
                          Icons.alarm,
                          color: Colors.black,
                        ),
                      ),
                      Text("05:00 PM"),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
