import 'package:flutter/material.dart';

class DoctorCard extends StatefulWidget {
  final data;
  const DoctorCard({super.key, required this.data});

  @override
  State<DoctorCard> createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard> {
  late Map<String, dynamic> Doctor;
  bool Fav = false;

  @override
  void initState() {
    super.initState();
    Doctor = widget.data;
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

  void liked() {
    setState(() {
      Fav = !Fav;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top:15.0,start: 15,end: 15),
      child: Container(
        height: 150,
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
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(14),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.asset(
                    Doctor["image"].toString(),
                    alignment: Alignment.centerLeft,
                    height: 130,
                  )),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align text to left
              children: [
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.start, // Align children to the start
                  children: [
                    Text(
                      "Dr.${Doctor["name"]}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        padding: EdgeInsets.zero, 
                        icon: Fav
                            ? const Icon(Icons.favorite_rounded)
                            : const Icon(Icons.favorite_border_rounded),
                        onPressed: () => liked(),
                        color: Fav ? Colors.pink : Colors.grey,
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
                const SizedBox(height: 5,),
                Text(
                  Doctor["field"].toString(),
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
                      Doctor["hospital"].toString(),
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
    
                Text(
                  Doctor["city"].toString(),
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
                    Text(Doctor["rating"].toString()),
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
                    Text(
                      "${Doctor["reviews"]} Reviews  ",
                      style: const TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.w300),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
