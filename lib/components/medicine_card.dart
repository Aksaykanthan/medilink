import 'package:flutter/material.dart';

class MedicineCard extends StatefulWidget {
  const MedicineCard({super.key});

  @override
  State<MedicineCard> createState() => _MedicineCardState();
}

class _MedicineCardState extends State<MedicineCard> {
  final Medicine = {
    "medicinename": "eno",
    "doctor": "Dr Shaun Murphy",
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290,
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
          Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
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
              Container(
                width: 50,
                height: 50,
                color: Colors.black,
                child:const Center(child: Text("Mon",style:TextStyle(color:Colors.white),textAlign: TextAlign.center,))
                
              )
            ],
          )
        ]),
      ),
    );
  }
}
