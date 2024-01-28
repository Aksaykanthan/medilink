import 'package:flutter/material.dart';
import 'package:project_01/components/bubble_btn.dart';


class MedicineCard extends StatefulWidget {
  const MedicineCard({super.key});

  @override
  State<MedicineCard> createState() => _MedicineCardState();
}

class _MedicineCardState extends State<MedicineCard> {
  final Medicine = {
    "medicinename": "eno",
    "doctor": "Dr Shaun Murphy",
    "days": 7
  };
  final Map<String, Map<String, Map<String,int>>> Frequency = {"Days":{"monday":{"morning":1, "afternoon":0,"night":1},"tuesday":{"morning":1, "afternoon":1,"night":1}}};

  void showInfo(String message) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Medicine Info"),
        content: Text(message),
      );
    },
  );
}


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
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
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              const Icon(
                Icons.medication_liquid_rounded,
                // color: Colors.grey[400],
                size: 34,
              ),
              const SizedBox(width: 7),
              Text(Medicine["medicinename"].toString(),
                  style: const TextStyle(
                      fontSize: 26, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("prescribed by:",
                  style: TextStyle(fontSize: 15, color: Colors.grey)),
              Text(Medicine["doctor"].toString(),
                  style:
                      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ], 
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              BubbleButton(text: "mon",color: Colors.green,onTap: () {
                if (Frequency.containsKey("Days") && Frequency["Days"]!.containsKey("monday")) {
                Map<String, int> MondaySchedule = Frequency["Days"]!["monday"]!;
                String message = '';
                MondaySchedule.forEach((TimeOfDay, value) {
                  message += TimeOfDay + ": " + (value == 1 ? 'Yes' : 'No') + '\n';
                });
                showInfo(message);
                }
                else{
                  showInfo("Data Unavailable".toString());
                }
                },),

              BubbleButton(text: "tue",color: Colors.green,onTap: () {
                if (Frequency.containsKey("Days") && Frequency["Days"]!.containsKey("tuesday")) {
                Map<String, int> MondaySchedule = Frequency["Days"]!["tuesday"]!;
                String message = '';
                MondaySchedule.forEach((TimeOfDay, value) {
                  message += TimeOfDay + ": " + (value == 1 ? 'Yes' : 'No') + '\n';
                });
                showInfo(message);
                }
                else{
                  showInfo("Data Unavailable".toString());
                }
                },),
             BubbleButton(text: "wed",color: Colors.green,onTap: () {
                if (Frequency.containsKey("Days") && Frequency["Days"]!.containsKey("wednesday")) {
                Map<String, int> MondaySchedule = Frequency["Days"]!["wednesday"]!;
                String message = '';
                MondaySchedule.forEach((TimeOfDay, value) {
                  message += TimeOfDay + ": " + (value == 1 ? 'Yes' : 'No') + '\n';
                });
                showInfo(message);
                }
                else{
                  showInfo("Data Unavailable".toString());
                }
                },),
              BubbleButton(text: "thu",color: Colors.green,onTap: () {
                if (Frequency.containsKey("Days") && Frequency["Days"]!.containsKey("thursday")) {
                Map<String, int> MondaySchedule = Frequency["Days"]!["thursday"]!;
                String message = '';
                MondaySchedule.forEach((TimeOfDay, value) {
                  message += TimeOfDay + ": " + (value == 1 ? 'Yes' : 'No') + '\n';
                });
                showInfo(message);
                }
                else{
                  showInfo("Data Unavailable".toString());
                }
                },),
              BubbleButton(text: "fri",color: Colors.green,onTap: () {
                if (Frequency.containsKey("Days") && Frequency["Days"]!.containsKey("friday")) {
                Map<String, int> MondaySchedule = Frequency["Days"]!["friday"]!;
                String message = '';
                MondaySchedule.forEach((TimeOfDay, value) {
                  message += TimeOfDay + ": " + (value == 1 ? 'Yes' : 'No') + '\n';
                });
                showInfo(message);
                }
                else{
                  showInfo("Data Unavailable".toString());
                }
                },),
              BubbleButton(text: "sat",color: Colors.green,onTap: () {
                if (Frequency.containsKey("Days") && Frequency["Days"]!.containsKey("saturday")) {
                Map<String, int> MondaySchedule = Frequency["Days"]!["saturday"]!;
                String message = '';
                MondaySchedule.forEach((TimeOfDay, value) {
                  message += TimeOfDay + ": " + (value == 1 ? 'Yes' : 'No') + '\n';
                });
                showInfo(message);
                }
                else{
                  showInfo("Data Unavailable".toString());
                }
                },),
              BubbleButton(text: "sun",color: Colors.green,onTap: () {
                if (Frequency.containsKey("Days") && Frequency["Days"]!.containsKey("sunday")) {
                Map<String, int> MondaySchedule = Frequency["Days"]!["sunday"]!;
                String message = '';
                MondaySchedule.forEach((TimeOfDay, value) {
                  message += TimeOfDay + ": " + (value == 1 ? 'Yes' : 'No') + '\n';
                });
                showInfo(message);
                }
                else{
                  showInfo("Data Unavailable".toString());
                }
                },),
            
            ],
          ),
          const SizedBox(height: 10),
          Row(children: [Text("Number of days to be consumed :",style: TextStyle(color: Colors.grey[800]),),Text(Medicine["days"].toString(),style: const TextStyle(color: Colors.indigo,fontSize: 15))]
          )
        ]),
      ),
    );
  }
}