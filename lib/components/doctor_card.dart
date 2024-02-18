import 'package:flutter/material.dart';
import 'package:project_01/pages/doctors/doctor_details.dart';

class DoctorCard extends StatefulWidget {
  final data;
  final docId;
  const DoctorCard({super.key, required this.data, this.docId});

  @override
  State<DoctorCard> createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard> {
  late Map<String, dynamic> doctor;
  late String docId;
  bool fav = false;

  @override
  void initState() {
    super.initState();
    doctor = widget.data;
    docId = widget.docId;
    // doctor = {
    //   "name": widget.name,
    //   "field": "Surgeon",
    //   "hospital": "St.Bonaventure Hospital",
    //   "city": "San Jose",
    //   "rating": 5,
    //   "reviews": 12,
    //   "image": "assets/icons/shaun.jpeg"
    // };
  }

  void liked() {
    setState(() {
      fav = !fav;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 15.0, start: 15, end: 15),
      child: GestureDetector(
        onTap: () => (Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DoctorDetails(data: doctor, docId: docId)))),
        child: Container(
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
            children: [
              Row(
                children: [
                  if (doctor["image"].runtimeType == String)...[Padding(
                    padding: const EdgeInsets.all(14),
                    child: SizedBox(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image.network(
                            doctor["image"].toString(),
                            alignment: Alignment.centerLeft,
                            height: 130,
                            width: 140,
                            fit: BoxFit.fill,
                          )),
                    ),
                  )]
                  else...[
                    Padding(
                    padding: const EdgeInsets.all(14),
                    child: SizedBox(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Container(alignment:Alignment.center,width: 140,height: 130,color: Colors.grey.shade200,child: const Text("No Pic"))
                      ),
                    ),)
                  ],
                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align text to left
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .start, // Align children to the start
                        children: [
                          Text(
                            "Dr.${doctor["name"]}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child:IconButton(
                              padding: EdgeInsets.zero,
                              icon: fav
                                  ? const Icon(Icons.favorite_rounded)
                                  : const Icon(Icons.favorite_border_rounded),
                              onPressed: () => liked(),
                              color: fav ? Colors.pink : Colors.grey,
                              iconSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 170,
                        height: 1,
                        color: Colors.grey.shade400,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        doctor["field"].toString(),
                        style: const TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.location_on_outlined, size: 15),
                          Text(
                            doctor["hospital"].toString(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Text(
                        doctor["city"].toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star_rate_rounded,
                            color: Colors.yellow,
                          ),
                          Text("${doctor["rating"]}"),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 2,
                            height: 18,
                            color: Colors.grey.shade300,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          // Text(
                          //   "${doctor["reviews"]} Reviews  ",
                          //   style: const TextStyle(
                          //       color: Colors.black54,
                          //       fontWeight: FontWeight.w300),
                          // )
                        ],
                      )
                    ],
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Divider(
                  thickness: 2,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[900],
                    fixedSize: const Size.fromWidth(300)),
                onPressed: () {},
                child: const Text(
                  'Book Appointment',
                  style: TextStyle(fontSize: 18,color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
