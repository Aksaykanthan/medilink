// ignore: file_names
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails({super.key});

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  bool Fav = false;
  var doctor = {
    'name': 'Shaun Murphy',
    'field': 'Surgeon',
    'hospital': 'St.Bonaventure Hospital',
    'patients_cnt': 1000,
    'experience': 10,
    'rating': 4.8,
    'reviews': 1394,
    'about_me':
        'Dr. Shaun Murphy is one of the most talented surgeons in San Jose.He has performed more than hundred difficult surjeries and the count goes on.',
    'work_days': 'Monday - Friday',
    'timings': '8.00 AM to 6.00 PM',
    'review': [
      {
        "name": "Melendez",
        "rating": 5,
        "review_body":
            'The quality of treatment and his behaviour towards patients are highly professional and friendly.'
      },
      {
        "name": "Melendez",
        "rating": 5,
        "review_body":
            'The quality of treatment and his behaviour towards patients are highly professional and friendly.'
      }
    ]
  };

  void all() {}

  void liked() {
    setState(() {
      Fav = !Fav;
    });
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
            icon: Fav
                ? const Icon(Icons.favorite_rounded)
                : const Icon(Icons.favorite_border_rounded),
            onPressed: () => liked(),
            color: Fav ? Colors.pink : Colors.black,
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
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.asset(
                      'assets/icons/shaun.jpeg',
                      alignment: Alignment.centerLeft,
                      height: 120,
                    ),
                  ),
                ),
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
              const SizedBox(
                height: 3,
                width: 20,
              ),
              CircleAvatar(
                radius: 28,
                backgroundColor: Colors.grey.shade200,
                child: const Icon(
                  Icons.people_alt_rounded,
                  size: 28,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 3,
                width: 40,
              ),
              CircleAvatar(
                radius: 28,
                backgroundColor: Colors.grey.shade200,
                child: const Icon(
                  Icons.people_alt_rounded,
                  size: 28,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 3,
                width: 40,
              ),
              CircleAvatar(
                radius: 28,
                backgroundColor: Colors.grey.shade200,
                child: const Icon(
                  Icons.people_alt_rounded,
                  size: 28,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 3,
                width: 40,
              ),
              CircleAvatar(
                radius: 28,
                backgroundColor: Colors.grey.shade200,
                child: const Icon(
                  Icons.people_alt_rounded,
                  size: 28,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          Row(
            children: [
              const SizedBox(
                height: 3,
                width: 27,
              ),
              Text(
                '${doctor['patients_cnt']}+',
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 3,
                width: 60,
              ),
              Text(
                '${doctor['experience']}+',
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 3,
                width: 70,
              ),
              Text(
                '${doctor['rating']}',
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 3,
                width: 64,
              ),
              Text(
                '${doctor['reviews']}',
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Row(
            children: [
              SizedBox(
                height: 3,
                width: 25,
              ),
              Text(
                'Patients',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black87,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 3,
                width: 46,
              ),
              Text(
                'Experience',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black87,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 3,
                width: 45,
              ),
              Text(
                'Rating',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black87,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 3,
                width: 54,
              ),
              Text(
                'Reviews',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black87,
                    fontWeight: FontWeight.w300),
              ),
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
            child: Text(doctor['about_me'].toString()),
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
          ReviewCard(review: doctor["review"] as List),
        ],
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  final List review;

  const ReviewCard({
    super.key,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(width: 20),
            const CircleAvatar(
              radius: 26,
              backgroundImage: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNqgFy_pnSg5_eaKpFcVyJ0nQTOT0XmAvM8w&usqp=CAU"),
            ),
            Column(
              children: [
                const Text(
                  "Melendez",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                const Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text("5"),
                    SizedBox(
                      width: 4,
                    ),
                    Icon(Icons.star_rate_rounded,
                        color: Colors.amber, size: 20),
                    Icon(Icons.star_rate_rounded,
                        color: Colors.amber, size: 20),
                    Icon(Icons.star_rate_rounded,
                        color: Colors.amber, size: 20),
                    Icon(Icons.star_rate_rounded,
                        color: Colors.amber, size: 20),
                    Icon(Icons.star_rate_rounded, color: Colors.amber, size: 20)
                  ],
                ),
                ReadMoreText(
                  "${review[0]["review_body"]}",
                  trimLines: 2,
                  textAlign: TextAlign.justify,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: " Show more ",
                  trimExpandedText: " Show less ",
                  moreStyle:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.bold),

                  ),
                
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
        ),
      ],
    );
  }
}
