import 'package:flutter/material.dart';
import 'package:project_01/pages/doctors/hospital_details.dart';

// class HospitalCard extends StatefulWidget {
//   const HospitalCard({super.key});
//   @override
//   State<HospitalCard> createState() => _HospitalCardState();
// }
class HospitalCard extends StatefulWidget {
  final data;
  final hospId;
  const HospitalCard({super.key, required this.data, this.hospId});

  @override
  State<HospitalCard> createState() => _HospitalCardState();
}

class _HospitalCardState extends State<HospitalCard> {
  late Map<String, dynamic> hospital;

  // final Hospital = {
  //   "name": "Sunrise Health",
  //   "location": "Bakers street",
  //   "rating": "5.0",
  //   "reviews": 123,
  //   "distance": "12 km",
  //   "type": "Hospital"
  // };
  @override
  void initState() {
    super.initState();
    hospital = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 15.0, start: 15, end: 15,bottom: 10),
      child: GestureDetector(
        onTap: () => (Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HospitalDetails(data: hospital, hospId: widget.hospId)))),
        child: Container(
          height: 300,
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
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
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
                    hospital["name"].toString(),
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: Colors.grey,
                        size: 20,
                      ),
                      Text(
                        hospital["location"].toString(),
                        style: TextStyle(color: Colors.grey[600], fontSize: 16),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        hospital["rating"].toString(),
                      ),
                      const Icon(
                        Icons.star_rate_rounded,
                        color: Colors.amber,
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        "(${hospital["review"]} reviews)",
                      ),
                    ],
                  ),
                  Container(
                    width: 340,
                    height: 1,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.directions_bike_rounded,
                        color: Colors.black54,
                        size: 16,
                      ),
                      Text("${hospital["distance"]} Km".toString()),
                      const SizedBox(
                        width: 150,
                      ),
                      const Icon(
                        Icons.local_hospital_outlined,
                      ),
                      Text(
                        " ${hospital["type"]}",
                      )
                    ],
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
