// ignore: file_names

import 'package:flutter/material.dart';

class DoctorDetails extends StatefulWidget {
  final data;
  final docId;
  DoctorDetails({super.key, required this.data, required this.docId});

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  bool fav = false;
  late Map<String, dynamic> doctor;
  // Map doctor = {
  //   'name': 'Shaun Murphy',=
  //   'field': 'Surgeon',
  //   'hospital': 'St.Bonaventure Hospital',
  //   'patients_cnt': 1000,
  //   'experience': 10,
  //   'rating': 4.8,
  //   'reviews': 1394,
  //   'about_me':
  //       'Dr. Shaun Murphy is one of the most talented surgeons in San Jose.He has performed more than hundred difficult surjeries and the count goes on.',
  //   'work_days': 'Monday - Friday',
  //   'timings': '8.00 AM to 6.00 PM',
  //   'review': [
  //     {
  //       "name": "Melendez",
  //       "rating": 5,
  //       "review_body":
  //           'The quality of treatment and his behaviour towards patients are highly professional and friendly.'
  //     },
  //     {
  //       "name": "Melendez",
  //       "rating": 5,
  //       "review_body":
  //           'The quality of treatment and his behaviour towards patients are highly professional and friendly.'
  //     }
  //   ]
  // };

  void all() {}

  void liked() {
    setState(() {
      fav = !fav;
    });
  }

  @override
  void initState() {
    super.initState();
    doctor = widget.data;
    // Doctor = {
    //   "name": widget.name,
    //   "field": "Surgeon",
    //   "hospital": "St.Bonaventure Hospital",
    //   "city": "San Jose",
    //   "rating": 5,
    //   "reviews": 12,
    //   "image": "assets/icons/shaun.jpeg"
    // };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        foregroundColor: Colors.white,
        backgroundColor: Colors.grey[900],
        title: const Text("Doctor Details"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: fav
                ? const Icon(Icons.favorite_rounded)
                : const Icon(Icons.favorite_border_rounded),
            onPressed: () => liked(),
            color: fav ? Colors.pink : Colors.black,
            iconSize: 25,
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 25),
          Container(
              height: 130,
              width: 340,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 8,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Row(children: [
                if (doctor["image"].runtimeType == String) ...[
                  Padding(
                    padding: const EdgeInsets.all(14),
                    child: SizedBox(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image.network(
                            doctor["image"].toString(),
                            alignment: Alignment.centerLeft,
                            height: 130,
                            width: 120,
                            fit: BoxFit.fill,
                          )),
                    ),
                  )
                ] else ...[
                  Padding(
                    padding: const EdgeInsets.all(14),
                    child: SizedBox(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Container(
                              alignment: Alignment.center,
                              width: 120,
                              height: 130,
                              color: Colors.grey.shade200,
                              child: const Text("No Pic"))),
                    ),
                  )
                ],
                Column(
                  children: [
                    const SizedBox(width: 100, height: 14),
                    Text(
                      "Dr.${doctor['name']}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 100, height: 4),
                    Container(
                      width: 180,
                      height: 2,
                      color: Colors.black38,
                    ),
                    const SizedBox(width: 100, height: 3),
                    Row(
                      children: [
                        Text(
                          doctor['field'].toString(),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 100, height: 3)
                      ],
                    ),
                    const SizedBox(width: 100, height: 7),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          size: 18,
                          color: Colors.black54,
                        ),
                        Text(
                          " ${doctor["hospital"]}",
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    )
                  ],
                )
              ])),
          const SizedBox(width: 100, height: 20),
          Row(
            children: [
              DetIcon(
                  icon: Icons.abc_sharp,
                  name: "Patients",
                  count: '${doctor['patient_count']}'),
              DetIcon(
                  icon: Icons.abc_sharp,
                  count: '${doctor['Experience']}',
                  name: 'Experience'),
              DetIcon(
                  icon: Icons.abc_sharp,
                  count: '${doctor['rating']}',
                  name: 'Rating'),
              const DetIcon(
                  icon: Icons.abc_sharp,
                  count: "0", //'${(doctor['reviews'] as List).length}',
                  name: 'Reviews'),
            ],
          ),
          const SizedBox(
            height: 13,
          ),
          const Row(
            children: [
              SizedBox(
                width: 16,
              ),
              Text(
                'About me',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: Text(doctor['aboutme'].toString()),
          ),
          const SizedBox(
            height: 12,
          ),
          const Row(
            children: [
              SizedBox(
                width: 16,
              ),
              Text(
                'Working Time',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                width: 18,
              ),
              Text(
                '${doctor['work_days']},  ${doctor['timings']}',
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              const SizedBox(
                width: 16,
              ),
              const Text(
                'Reviews',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              TextButton(
                  onPressed: () => all(),
                  child: const Text(
                    "See All",
                    style: TextStyle(color: Colors.black54),
                  ))
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          if (doctor["reviews"] != null) ...[
            Expanded(
              child: ListView.builder(
                itemCount: (doctor["reviews"] as List).length,
                itemBuilder: (BuildContext context, int index) {
                  // Create and return MyWidget for each index
                  return ReviewCard(review: doctor["reviews"][index]);
                },
              ),
            ),
          ] else ...[
            Container(
              alignment: Alignment.center,
              child: const Text(
                "No Reviews Found",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            )
          ]
        ],
      ),
    );
  }
}

class DetIcon extends StatelessWidget {
  final icon;
  final String count;
  final String name;
  const DetIcon({
    super.key,
    required this.icon,
    required this.count,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.grey.shade200,
            child: Icon(
              icon,
              size: 28,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            count,
            style: const TextStyle(
                fontSize: 15,
                color: Colors.black87,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            name,
            style: const TextStyle(
                fontSize: 12,
                color: Colors.black87,
                fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  final Map review;

  ReviewCard({
    super.key,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 20),
        const CircleAvatar(
          radius: 26,
          // backgroundImage: NetworkImage(
          //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNqgFy_pnSg5_eaKpFcVyJ0nQTOT0XmAvM8w&usqp=CAU"),
        ),
        Column(
          children: [
            Text(
              review["patient_name"],
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Text(
                  review["ratings"].toString(),
                ),
                const SizedBox(
                  width: 4,
                ),
                const Icon(Icons.star_rate_rounded,
                    color: Colors.amber, size: 20),
                const Icon(Icons.star_rate_rounded,
                    color: Colors.amber, size: 20),
                const Icon(Icons.star_rate_rounded,
                    color: Colors.amber, size: 20),
                const Icon(Icons.star_rate_rounded,
                    color: Colors.amber, size: 20),
                const Icon(Icons.star_rate_rounded,
                    color: Colors.amber, size: 20)
              ],
            ),
            // ReadMoreText(
            //   "${review[0]["review_body"]}",
            //   trimLines: 2,
            //   textAlign: TextAlign.justify,
            //   trimMode: TrimMode.Line,
            //   trimCollapsedText: " Show more ",
            //   trimExpandedText: " Show less ",
            //   moreStyle:
            //       const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),

            //   ),

            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            //   child: Wrap(
            //     children: [
            //       SelectableText("${review[0]["review_body"]}"),
            //     ],
            //   ),
            // ),
          ],
        )
      ],
    );
  }
}
