import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:project_01/components/doctor_card.dart';
import 'package:project_01/widget/slider.dart';

class HospitalDetails extends StatefulWidget {
  HospitalDetails({super.key});

  @override
  State<HospitalDetails> createState() => _HospitalDetailsState();
}

class _HospitalDetailsState extends State<HospitalDetails> {
  final hospital = {
    'name': 'Apollo Hospitals',
    'location':
        'https://www.google.com/maps/dir//Tower+49,+Apollo+Clinic,+1st+KTS,+1,+Sathy+Rd,+Athipalayam+Pirivu,+Ganapathy,+Coimbatore,+Tamil+Nadu+641006/data=!4m6!4m5!1m1!4e2!1m2!1m1!1s0x3ba858e2c2fdc92d:0x9bef8ad9fab36fbd?sa=X&ved=2ahUKEwjmsLvkh4CEAxVGV2wGHQeJDywQ48ADegQIHxAA',
    'address':
        ' Tower 49, 1st KTS, 1, Sathy Rd,\n Athipalayam Pirivu, Ganapathy,\n Coimbatore, Tamil Nadu 641006',
    'about_us':
        'Apollo has been one of the greatest hospitals around the city and is now the top fourth hospital in the country. Our srevices are top notch',
    "contact_number": "91+ 92384 79234 \n91+ 47834 93492",
    "contact_email": 'apollohospital@gmail.com'
  };
  bool docex = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          foregroundColor: Colors.white,
          backgroundColor: Colors.grey[900],
          title: const Text("Hospital Details"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              hospital['name']!,
              style: TextStyle(
                  color: Colors.grey[750],
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.8,
                  wordSpacing: 3),
            ),
            const Divider(
              height: 3,
              thickness: 6,
              endIndent: 50,
            ),
            Container(
                decoration: const BoxDecoration(), 
                child: const imgSlider()),
            const SizedBox(height: 20),
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey.shade200,
                  child: const Icon(
                    Icons.phone,
                    size: 26,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  hospital["contact_number"]!,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey.shade200,
                  child: const Icon(
                    Icons.email_outlined,
                    size: 26,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  hospital["contact_email"]!,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey.shade200,
                  child: const Icon(
                    Icons.location_on_rounded,
                    size: 26,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  hospital["address"]!,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500),
                )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              "About Us",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const Divider(
              height: 3,
              thickness: 2,
              endIndent: 260,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              hospital['about_us']!,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 14,
            ),
            ExpansionPanelList(
              elevation: 0,
              expansionCallback: (panelIndex, isExpanded) {
                setState(() {
                  docex = !docex;
                });
              },
              children: [
                ExpansionPanel(
                  headerBuilder: (context, docex) {
                    return const ListTile(
                      title: Text("Our Doctors",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                    );
                  },
                  body: const Text("These are all the Doctors")),
              ]
                  ),
            const SizedBox(
              height: 10,
            ),
            ExpansionPanelList(
              elevation: 0,
              expansionCallback: (panelIndex, isExpanded) {
                setState(() {
                  docex = !docex;
                });
              },
              children: [
                ExpansionPanel(
                  headerBuilder: (context, docex) {
                    return const ListTile(
                      title: Text("Specialities",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                    );
                  },
                  body: const Text("These are all the Doctors")),
              ]
                  ),
            ],
            )
          ),
        ));
  }
}
