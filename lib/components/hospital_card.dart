import 'package:flutter/material.dart';

class HospitalCard extends StatefulWidget {
  const HospitalCard({super.key});
  @override
  State<HospitalCard> createState() => _HospitalCardState();
}

class _HospitalCardState extends State<HospitalCard> {
  final Hospital = {
    "name": "Sunrise Health",
    "location": "Bakers street",
    "rating": "5.0",
    "reviews": 123,
    "distance": "12 km",
    "type": "Hospital"
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
      child: Column(children: [
        Padding(
          // padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
          padding: EdgeInsets.zero,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            child: Image.asset(
              "assets/icons/hospital.png",
              alignment: Alignment.centerLeft,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Hospital["name"].toString(),
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: Colors.grey,
                    size: 20,
                  ),
                  Text(
                    Hospital["location"].toString(),
                    style: TextStyle(color: Colors.grey[700]),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    Hospital["rating"].toString(),
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Text(
                    "(" + Hospital["reviews"].toString() + " reviews)",
                  ),
                ],
              ),
              Container(
                width: 340,
                height: 1,
                color: Colors.grey.shade400,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.linear_scale_outlined,
                    color: Colors.grey,
                  ),
                  Text(Hospital["distance"].toString()),
                  SizedBox(width: 150,),
                  Icon(Icons.local_hospital_outlined,),
                  Align(
                    child: Text(
                      " "+Hospital["type"].toString(),
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}
