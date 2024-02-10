
import 'package:flutter/material.dart';
import 'package:project_01/pages/report/lab_test_page.dart';

class ReportCard extends StatelessWidget {
  final data;
  ReportCard({super.key, this.data});

  void navLabTestPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LabTestPage()));
  }

  // final DocTest = data as Map<String,dynamic>;

  final DocTest = {
    "reason": "Fever",
    "name": "Dr.Shaun Murphy",
    "date": "12-05-2005",
    "summary":"summary placeholder...."
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        padding: const EdgeInsets.only(top: 8, left: 15, right: 15),
        height: 230,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DocTest["reason"].toString(),
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.download))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(DocTest["name"].toString(),style: TextStyle(color: Colors.grey[700]),),
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_month,
                      color: Colors.black,
                    ),
                    Text(DocTest["date"].toString(),style: TextStyle(color: Colors.grey[700]),),
                  ],
                ),
              ],
            ),
            const Divider(),
            Text(DocTest["summary"].toString())
          ],
        ),
      ),
    );
  }
}
