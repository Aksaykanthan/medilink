import 'package:flutter/material.dart';
import 'package:project_01/pages/report/lab_test_page.dart';

class ReportCard extends StatelessWidget {
  ReportCard({super.key});

  void navLabTestPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LabTestPage()));
  }

  final DocTest = {
    "reason": "Consultation Reason",
    "name": "Dr.Shaun Murphy",
    "date": "12-05-2005",
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: GestureDetector(
        onTap: () => {navLabTestPage(context)},
        child: Container(
          padding: EdgeInsets.only(top: 20, left: 10),
          height: 120,
          width: 340,
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
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DocTest["reason"].toString(),
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(DocTest["name"].toString()),
                  SizedBox(
                    width: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      width: 130,
                      height: 45,
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
                          Text(DocTest["date"].toString()),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
