import 'package:flutter/material.dart';
import 'package:project_01/components/homepage/RadialGraph.dart';
import 'package:project_01/components/round_cont.dart';
import 'package:project_01/components/upcoming_card.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<double> walking = [10, 11, 20, 4, 23, 30, 22];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 12, left: 13, right: 12),
              child: Text("Hi Isabela!",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 22)),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 13, right: 12),
              child: Text("Hope you have a great day!",
                  style: TextStyle(
                      fontWeight: FontWeight.w400, color: Colors.black54)),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 12, left: 12, right: 12, bottom: 6),
                child: Container(
                  padding: EdgeInsets.all(2),
                  height: 200,
                  width: 350,
                  decoration: const BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      "assets/icons/banner.png",
                      height: 150.0,
                      width: 100.0,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 3; i++)
                  RoundCont(
                    width: 7,
                    height: 7,
                    bgColor: i == 0 ? Colors.green : Colors.black,
                    margin: const EdgeInsets.only(right: 8),
                  ),
              ],
            ),
            const SizedBox(height: 15),
            const DoandDont(),
            const Padding(
              padding: EdgeInsets.only(top: 4, left: 12, right: 12),
              child: ActivityCard(),
            ),
            const SizedBox(height: 15),
            const RecommendedDoctor(),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}

class RecommendedDoctor extends StatelessWidget {
  const RecommendedDoctor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(" Recommended Doctors",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              Text("View All", style: TextStyle(color: Color(0xFF5F79A8)))
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 175,
          child: ListView(
            padding: const EdgeInsets.only(left: 10),
            scrollDirection: Axis.horizontal,
            children: [
              Doctorreccard(
                name: "Dr. Sam Smith",
                speciality: "Orthopedic",
                experience: 15,
                rating: 4.6,
                image:
                    "https://img.freepik.com/premium-photo/professional-nurse-doctor-hospital-physician-with-natural-portrait-style-woman-female-with-arms-crossed-healthcare-medical-wellness-happy-confident-proud-real-smile_590464-198957.jpg",
              ),
              Doctorreccard(
                name: "Dr. Samuel Patel",
                speciality: "Pediatrics",
                experience: 9,
                rating: 4.3,
                image:
                    "https://img.freepik.com/premium-photo/portrait-young-handsome-indian-man-doctor-white_251136-79251.jpg",
              ),
              Doctorreccard(
                name: "Dr. Daniel Williams",
                speciality: "Dermatology",
                experience: 8,
                rating: 4.8,
                image:
                    "https://www.shutterstock.com/image-photo/doctor-dark-hair-beard-white-600nw-2131787203.jpg",
              ),
              Doctorreccard(
                name: "Dr. Javier Fernandez",
                speciality: "Psychiatry",
                experience: 7,
                rating: 4.5,
                image:
                    "https://us.123rf.com/450wm/corporatesounds/corporatesounds2309/corporatesounds230920127/213793591-portrait-of-smiling-doctor-standing-in-front-of-group-of-medical-staff.jpg?ver=6",
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DoandDont extends StatelessWidget {
  const DoandDont({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Row(children: [
        const SizedBox(
          width: 4,
        ),
        Expanded(
          child: Container(
              height: 130,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 30,
                    width: 180,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10)),
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(255, 147, 218, 106),
                          Color.fromARGB(255, 2, 76, 15)
                        ])),
                    child: const Row(
                      children: [
                        SizedBox(
                          width: 8,
                        ),
                        Text("Do's",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white70),
                            textAlign: TextAlign.left),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8, left: 8),
                    child: Text("-> 40g Proteins daily",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500)),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 4, left: 8),
                    child: Text("-> Physiotherapy (Wed)",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500)),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 4, left: 8),
                    child: Text("-> Bed Rest (2 Days)",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500)),
                  ),
                ],
              )),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Container(
              height: 130,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 30,
                    width: 180,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10)),
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(255, 246, 171, 41),
                          Colors.deepOrange
                        ])),
                    child: const Row(
                      children: [
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Dont's",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8, left: 8),
                    child: Text("-> No Walking (week)",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500)),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 4, left: 8),
                    child: Text("-> Less Salt Usage",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500)),
                  ),
                ],
              )),
        ),
        const SizedBox(
          width: 4,
        ),
      ]),
    );
  }
}

class Doctorreccard extends StatelessWidget {
  String name;
  String speciality;
  double rating;
  String image;
  int experience;

  Doctorreccard(
      {super.key,
      required this.name,
      required this.speciality,
      required this.rating,
      required this.image,
      required this.experience});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
        height: 170,
        width: 140,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6), color: Colors.white),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: const EdgeInsets.only(top: 6, left: 5, bottom: 2),
              child: Container(
                padding: EdgeInsets.all(2), // Border width
                decoration: BoxDecoration(
                    color: Colors.grey.shade500, shape: BoxShape.circle),
                child: ClipOval(
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(22), // Image radius
                    child: Image.network(image, fit: BoxFit.cover),
                  ),
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: Text(name,
                maxLines: 1,
                overflow: TextOverflow.fade,
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: Text(speciality,
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                    fontWeight: FontWeight.w400)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6.0, top: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("$experience years",
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w400)),
                Row(
                  children: [
                    const Icon(Icons.star_rate_rounded,
                        color: Colors.yellow, size: 18),
                    Text("$rating/5",
                        style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                height: 30,
                width: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.black87),
                child: Text(
                  "Book",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade400),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class ActivityCard extends StatelessWidget {
  const ActivityCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          height: 335,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 14),
                child: Text(
                  DateFormat.MMMEd().format(DateTime.now()),
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const SizedBox(
                  width: 12,
                ),
                const Expanded(
                    child: Text("Activity",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w600))),
                IconButton(
                    icon: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 18,
                    ),
                    onPressed: () {})
              ]),
              Padding(
                padding: const EdgeInsets.only(left: 14),
                child: RichText(
                  text: TextSpan(
                    text: '',
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Looking good! ',
                          style: TextStyle(
                              color: Colors.blue[300],
                              fontWeight: FontWeight.w500,
                              fontSize: 15)),
                      TextSpan(
                          text:
                              "Health stats are up from\nyesterday's check-in.",
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontWeight: FontWeight.w400,
                              fontSize: 14)),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                child: Divider(
                  height: 3,
                  thickness: 1,
                  color: Colors.grey[400],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ColorInd(
                          bgColor: Color.fromARGB(255, 231, 58, 107),
                          text1: "Walking",
                          text2: "256/300 kcal",
                        ),
                        ColorInd(
                          bgColor: Color.fromARGB(205, 152, 4, 132),
                          text1: "Workout",
                          text2: "30/40 MIN",
                        ),
                        ColorInd(
                          bgColor: Color.fromARGB(253, 9, 98, 207),
                          text1: "Sleep",
                          text2: "6/8 H",
                        ),
                      ],
                    ),
                  ),
                  Radial()
                ]),
              )
            ],
          )),
    );
  }
}

class ColorInd extends StatelessWidget {
  const ColorInd({
    super.key,
    this.bgColor = Colors.black,
    this.text1 = "Hello",
    this.text2 = "World",
  });

  final Color bgColor;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            RoundCont(bgColor: this.bgColor, width: 5, height: 14),
            const SizedBox(
              width: 6,
            ),
            Text(
              text1,
              style: TextStyle(
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
            )
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        const Text(
          "256/300 kcal",
          style: TextStyle(
              fontSize: 19, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        const SizedBox(
          height: 4,
        ),
      ],
    );
  }
}

class IndividualBar {
  final int x;
  final double y;

  IndividualBar({required this.x, required this.y});
}

class BarData {
  final double sunDist;
  final double monDist;
  final double tueDist;
  final double wedDist;
  final double thuDist;
  final double friDist;
  final double satDist;

  BarData(
      {required this.sunDist,
      required this.monDist,
      required this.tueDist,
      required this.wedDist,
      required this.thuDist,
      required this.friDist,
      required this.satDist});

  List<IndividualBar> barData = [];

  void initializeBar() {
    barData = [
      IndividualBar(x: 1, y: sunDist),
      IndividualBar(x: 2, y: monDist),
      IndividualBar(x: 3, y: tueDist),
      IndividualBar(x: 4, y: wedDist),
      IndividualBar(x: 5, y: thuDist),
      IndividualBar(x: 6, y: friDist),
      IndividualBar(x: 7, y: satDist)
    ];
  }
}

// SingleChildScrollView(
//         padding: const EdgeInsets.only(top: 26, left: 18, right: 18),
//         child: Column(
//             children: [
//               const ActivityCard(),
//               const SizedBox(height: 15),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(" Recommnded Doctors",
//                       style:
//                           TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
//                   Text("View All", style: TextStyle(color: Color(0xFF5F79A8)))
//                 ],
//               ),
// Padding(
//   padding: const EdgeInsets.all(1.0),
//   child: ListView(
//     scrollDirection: Axis.horizontal,
//     children: [
//       Container(width:50,color: Colors.black,),
//       Container(width:50,color: Colors.black,),
//       Container(width:50,color: Colors.black,),
//       ]),
//               )
//             ]),
//       ),
